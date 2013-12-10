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

class pdns::config(
  $config_file                        = $::pdns::params::config_file,
  $config_owner                       = $::pdns::params::config_owner,
  $config_group                       = $::pdns::params::config_group,
  $setuid                             = 'pdns',
  $setgid                             = 'pdns',
  $allow_axfr_ips                     = undef,
  $allow_recursion                    = undef,
  $allow_recursion_override           = undef,
  $cache_ttl                          = undef,
  $chroot                             = undef,
  $config_dir                         = undef,
  $config_name                        = undef,
  $control_console                    = undef,
  $daemon                             = undef,
  $default_soa_name                   = undef,
  $default_ttl                        = undef,
  $disable_axfr                       = undef,
  $disable_tcp                        = undef,
  $distributor_threads                = undef,
  $do_ipv6_additional_processing      = undef,
  $edns_subnet_option_number          = undef,
  $edns_subnet_processing             = undef,
  $entropy_source                     = undef,
  $fancy_records                      = undef,
  $guardian                           = undef,
  $lazy_recursion                     = undef,
  $load_modules                       = undef,
  $local_address                      = undef,
  $local_ipv6                         = undef,
  $local_port                         = undef,
  $log_dns_details                    = undef,
  $log_dns_queries                    = undef,
  $log_failed_updates                 = undef,
  $logfile                            = undef,
  $logging_facility                   = undef,
  $loglevel                           = undef,
  $master                             = undef,
  $max_cache_entries                  = undef,
  $max_queue_length                   = undef,
  $max_tcp_connections                = undef,
  $module_dir                         = undef,
  $negquery_cache_ttl                 = undef,
  $no_shuffle                         = undef,
  $out_of_zone_additional_processing  = undef,
  $overload_queue_length              = undef,
  $pipebackend_abi_version            = undef,
  $query_cache_ttl                    = undef,
  $query_local_address                = undef,
  $query_local_address6               = undef,
  $query_logging                      = undef,
  $queue_limit                        = undef,
  $receiver_threads                   = undef,
  $recursive_cache_ttl                = undef,
  $recursor                           = undef,
  $retrieval_threads                  = undef,
  $send_root_referral                 = undef,
  $server_id                          = undef,
  $signing_threads                    = undef,
  $slave                              = undef,
  $slave_cycle_interval               = undef,
  $slave_renotify                     = undef,
  $smtpredirector                     = undef,
  $soa_expire_default                 = undef,
  $soa_minimum_ttl                    = undef,
  $soa_refresh_default                = undef,
  $soa_retry_default                  = undef,
  $soa_serial_offset                  = undef,
  $socket_dir                         = undef,
  $strict_rfc_axfrs                   = undef,
  $tcp_control_address                = undef,
  $tcp_control_port                   = undef,
  $tcp_control_range                  = undef,
  $tcp_control_secret                 = undef,
  $trusted_notification_proxy         = undef,
  $urlredirector                      = undef,
  $use_logfile                        = undef,
  $version_string                     = undef,
  $webserver                          = undef,
  $webserver_address                  = undef,
  $webserver_password                 = undef,
  $webserver_port                     = undef,
  $webserver_print_arguments          = undef,
  $wildcard_url                       = undef
) {

  concat { 'pdns-config':
    owner   => $config_owner,
    group   => $config_group,
    mode    => '0644',
    name    => $config_file,
    notify  => Service['pdns-service']
  }

  concat::fragment { 'pdns-config-fragment':
    order   => '00',
    target  => $config_file,
    content => template('pdns/pdns.conf.erb'),
  }

}
