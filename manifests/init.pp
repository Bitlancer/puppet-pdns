node default {

 class { 'pdns::server':
    config_hash => {
      allow_recursion => "192.168.1.0/24"
    },
    backend_hash => {
      ldap_host => "ldap://exmaple.com:389/ ldap://anotherexample.com:389/"
    }
  }

}
