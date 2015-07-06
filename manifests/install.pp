# -*- mode: ruby -*-
# vi: set ft=ruby :

class android::install {

  exec { "download-sdk-android":
    command   => "/usr/bin/wget http://dl.google.com/android/android-sdk_r24.3.3-linux.tgz -O /tmp/android-sdk.tgz",
    creates   => "/tmp/android-sdk.tgz",
    logoutput => true,
    timeout   => 0,
    require   => Class["common::basic"]
  }

  exec { "tar-sdk-android":
    command => "/bin/tar xvzf /tmp/android-sdk.tgz",
    cwd     => "/opt/",
    creates => "/opt/android-sdk_r24.3.3-linux",
    require => Exec["download-sdk-android"]
  }

}
