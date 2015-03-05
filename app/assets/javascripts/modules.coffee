# register all modules
app = angular.module('reqApp', ['ngRoute', 'ngResource'])
app.controller('MainController', ['$scope', '$location', ($scope, $location) ->
  $scope.changeView = (path) ->
    $location.path(path)
])
app.controller('TrapsController', ['Traps', '$scope', (Traps, $scope) ->
  $scope.traps = Traps.query()
])

app.controller('TrapController', ['Trap', '$scope', '$routeParams', (Trap, $scope, $routeParams) ->
  $scope.requests = Trap.query(trap_id: $routeParams.trap_id)
])

app.controller('RequestController', ['Request', '$scope', '$routeParams', (Request, $scope, $routeParams) ->
  $scope.request = Request.get(trap_id: $routeParams.trap_id, id: $routeParams.id)
])

app.config [
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

    # enabling html5Mode
    $locationProvider.html5Mode true
]

app.factory('Traps', ['$resource', ($resource) ->
  return $resource('/traps.json',  query: {method: 'GET', isArray: true})
])

app.factory('Trap', ['$resource', ($resource) ->
  return $resource('/traps/:trap_id/requests.json', {trap_id: '@trap_id'}, query: {method: 'GET', isArray: true})
])

app.factory('Request', ['$resource', ($resource) ->
  return $resource('/traps/:trap_id/requests/:id.json', {trap_id: '@trap_id', id: '@id'}, show: {method: 'GET'})
])

app.filter('humanReadable', () ->
  return (input) ->
    input.toString()
    input = input.replace('_', ' ')
    input.capitalize()
    return input
)