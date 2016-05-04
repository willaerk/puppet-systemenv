class systemenv (
  $variables = {}
) inherits systemenv::params {

  create_resources(systemenv::var, $variables)
}
