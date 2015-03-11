# Register all modules
# Sub module for resources
angular.module('reqApp.service', [
  'ngResource'
])
# Sub module for routes
angular.module('reqApp.routes', [
  'ngRoute'
])
# Main application module
angular.module('reqApp', [
  'reqApp.routes'
  'reqApp.service'
])


