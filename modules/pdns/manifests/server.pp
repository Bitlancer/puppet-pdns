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

class pdns::server (
  $pkg_name     = $::pdns::params::pkg_name,
  $pkg_provider = $::pdns::params::pkg_provider,
  $pkg_version  = 'present',
  $service_name = $::pdns::params::service_name,
  $config_hash  = {},
  $backend_type = 'ldap',
  $backend_hash = {}
) inherits pdns::params {

  package { 'pdns-package':
    ensure    => $pkg_version,
    name      => $pkg_name,
    provider  => $pkg_provider,
  }

  Package['pdns-package'] -> Service['pdns-service']

  service { 'pdns-service':
    ensure      => 'running',
    name        => $service_name,
    enable      => true,
    hasrestart  => true,
    hasstatus   => false,
    status      =>
      "/sbin/service ${service_name} status | /bin/grep -v \"not running\"",
  }

  $config_class = { 'pdns::config' => $config_hash }
  create_resources( 'class', $config_class )

  $backend_class = { "pdns::backends::${backend_type}" => $backend_hash }
  create_resources( 'class', $backend_class )

}
