angular.module('reqApp').config [
  '$routeProvider'
  '$locationProvider'
  ($routeProvider, $locationProvider) ->
    $routeProvider
    .when '/traps',
      templateUrl: '/assets/index.html',
      controller: 'TrapsController',
      controllerAs: 'trapsCtrl'
    .when '/traps/:trap_id/requests',
      templateUrl: '/assets/show.html',
      controller: 'TrapController',
      controllerAs: 'trapCtrl'
    .when '/traps/:trap_id/requests/:id',
      templateUrl: '/assets/request_show.html',
      controller: 'RequestController',
      controllerAs: 'requestCtrl'
    .when '/',
      templateUrl: '/assets/home.html',
      controller: 'HomeController',
      controllerAs: 'homeCtrl'

    # enabling html5Mode
    $locationProvider.html5Mode(true)
]