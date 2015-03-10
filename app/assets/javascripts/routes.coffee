angular.module('reqApp').config [
  '$routeProvider'
  '$locationProvider'
  ($routeProvider, $locationProvider) ->
    $routeProvider
    .when '/',
      templateUrl: 'home.html',
      controller: 'HomeController',
      controllerAs: 'homeCtrl'
    .when '/traps',
      templateUrl: 'index.html',
      controller: 'TrapsController',
      controllerAs: 'trapsCtrl'
    .when '/traps/:trap_id/requests',
      templateUrl: 'show.html',
      controller: 'TrapController',
      controllerAs: 'trapCtrl'
    .when '/traps/:trap_id/requests/:id',
      templateUrl: 'request_show.html',
      controller: 'RequestController',
      controllerAs: 'requestCtrl'

    # enabling html5Mode
    $locationProvider.html5Mode(true)
]