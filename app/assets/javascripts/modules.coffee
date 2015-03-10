# register all modules

angular.module('reqApp.service', [
  'ngResource'
])
angular.module('reqApp.routes', [
  'ngRoute'
])
angular.module('reqApp', [
  'reqApp.routes'
  'reqApp.service'
])


