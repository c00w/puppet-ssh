class ssh {
    package {"openssh-server":
        ensure  => latest,
        alias   => "ssh"
    }

    service {"ssh":
        ensure  => running,
        enable  => true,
    }

    file {'/etc/ssh/sshd_config':
        ensure  => present,
        owner   => root,
        group   => root,
        source  => "puppet:///modules/ssh/sshd_config",
        mode    => 0600,
        notify  => Service['ssh']
    }
    Package["ssh"] -> Service["ssh"]
}
