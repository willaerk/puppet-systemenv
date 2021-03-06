define systemenv::var (
  $ensure = 'present',
  $varname = $name,
  $value = undef,
) {
  include systemenv::params

  validate_re($ensure, '^present|absent$')
  validate_re($varname, '^[a-zA-Z][a-zA-Z0-9_]+')

  $target = $systemenv::params::default_env_settings_file
  validate_absolute_path($target)

  ini_setting { "${varname}=${value}":
    ensure => $ensure,
    path => $target,
    section => '',
    setting => $varname,
    value => $value,
    key_val_separator => '=',
  }
}
