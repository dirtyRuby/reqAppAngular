# register all modules
app = angular.module('reqApp', ['ngRoute', 'ngResource'])

app.controller('TrapsController', [ '$http', '$scope', ($http, $scope) ->
    $http.get('/').success((data) ->
      $scope.traps = data
  )
])

app.config [
  '$routeProvider'
  '$locationProvider'
  ($routeProvider, $locationProvider) ->
    $routeProvider
    .when '/',
      templateUrl: '/assets/index.html',
      controller: 'TrapsController',
      controllerAs: 'trapsCtrl'

    # enabling html5Mode
    $locationProvider.html5Mode true
]

app.factory('TrapsService', [
  '$resource'
  ($resource) ->
   return $resource('/')
])