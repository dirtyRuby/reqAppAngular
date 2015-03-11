# Routes configuration
angular.module('reqApp').config [
  '$routeProvider'
  '$locationProvider'
  ($routeProvider, $locationProvider) ->
    $routeProvider
    # /traps
    # /traps.jso
    .when '/',
      templateUrl: 'assets/home.html',
      controller: 'HomeController',
      controllerAs: 'homeCtrl'
    .when '/traps',
      templateUrl: 'assets/index.html',
      controller: 'TrapsController',
      controllerAs: 'trapsCtrl'
    # /traps/:trap_id/requests
    # /traps/:trap_id/requests.json
    .when '/traps/:trap_id/requests',
      templateUrl: 'assets/show.html',
      controller: 'TrapController',
      controllerAs: 'trapCtrl'
    # /traps/:trap_id/requests/:id
    # /traps/:trap_id/requests/:id.json
    .when '/traps/:trap_id/requests/:id',
      templateUrl: 'assets/request_show.html',
      controller: 'RequestController',
      controllerAs: 'requestCtrl'
    # /
    .when '/',
      templateUrl: '/assets/home.html',
      controller: 'HomeController',
      controllerAs: 'homeCtrl'

    # enabling html5Mode
    $locationProvider.html5Mode(true)
]