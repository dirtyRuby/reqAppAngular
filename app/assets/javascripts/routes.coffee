angular.module('reqApp').config [
  '$routeProvider'
  '$locationProvider'
  ($routeProvider, $locationProvider) ->
    $routeProvider
    .when '/traps',
      templateUrl: '/templates/index.html',
      controller: 'TrapsController',
      controllerAs: 'trapsCtrl'
    .when '/traps/:trap_id/requests',
      templateUrl: '/templates/show.html',
      controller: 'TrapController',
      controllerAs: 'trapCtrl'
    .when '/traps/:trap_id/requests/:id',
      templateUrl: '/templates/request_show.html',
      controller: 'RequestController',
      controllerAs: 'requestCtrl'
    .when '/',
      templateUrl: '/templates/home.html',
      controller: 'HomeController',
      controllerAs: 'homeCtrl'

    # enabling html5Mode
    $locationProvider.html5Mode(true)
]