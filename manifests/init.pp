class minecraft {
        package {
                "default-jdk": ensure => installed;
        }

	package{
		"screen": ensure => installed;
	}

        file { "/home/minecraft/minecraft/minecraft_server.jar":
                source  => [
                        # from modules/minecraft/files/$hostname/minecraft_server.jar
                        "puppet:///modules/minecraft/$hostname/minecraft_server.jar",
                        # from modules/minecraft/files/minecraft_server.jar
                        "puppet:///modules/minecraft/minecraft_server.jar",
                ],
                mode    => 755,
                owner   => root,
                group   => root,
                # package must be installed before configuration file
                require => [Package["default-jdk"],
			    Package["screen"]],
        }
	
	file{"/etc/init.d/minecraft":
		source => ["puppet:///modules/minecraft/minecraft",],
		mode   => 755,
		owner  => root,
		group  => root,
	}
	
	service { "minecraft":
                # automatically start at boot time
                enable     => true,
                # restart service if it is not running
                ensure     => running,
                # "service ssh status" returns useful service status info
                hasstatus  => true,
                # "service ssh restart" can restart service
                hasrestart => true,
                # package and configuration must be present for service
                require    => [ Package["default-jdk"],
				Package["screen"],
                                File["/etc/init.d/minecraft"],
				File["/home/minecraft/minecraft/minecraft_server.jar"]],
                # changes to configuration cause service restart
                subscribe  => File["/home/minecraft/minecraft/minecraft_server.jar"],
        }
}
