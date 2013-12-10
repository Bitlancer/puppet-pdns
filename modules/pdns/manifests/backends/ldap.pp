#
# Copyright 2013, Bitlancer LLC (contact@bitlancer.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class pdns::backends::ldap (
  $ldap_pkg_name      = $::pdns::backends::params::ldap_pkg_name,
  $ldap_pkg_provider  = $::pdns::backends::params::ldap_pkg_provider,
  $ldap_pkg_version   = 'present',
  $ldap_host          = 'ldap://127.0.0.1:389/',
  $ldap_starttls      = 'no',
  $ldap_basedn        = '',
  $ldap_binddn        = '',
  $ldap_secret        = '',
  $ldap_method        = 'simple',
  $ldap_filter_axfr   = '(:target:)',
  $ldap_filter_lookup = '(:target:)'
) inherits pdns::backends::params {

  package { 'pdns-ldap-pkg':
    ensure    => $ldap_pkg_version,
    name      => $ldap_pkg_name,
    provider  => $ldap_pkg_provider,
  }

  concat::fragment { 'pdns-ldap-config-fragment':
    order   => '01',
    target  => $::pdns::params::config_file,
    content => template('pdns/backends/pdns-ldap.conf.erb'),
  }

}
