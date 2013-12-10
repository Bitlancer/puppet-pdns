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

class pdns::params {

  case $::osfamily {
    'RedHat': {
      $pkg_name     = 'pdns'
      $pkg_provider = 'yum'
      $service_name = 'pdns'
      $config_file  = '/etc/pdns/pdns.conf'
      $config_owner = 'pdns'
      $config_group = 'pdns'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}")
    }
  }

}
