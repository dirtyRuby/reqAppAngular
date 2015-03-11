# Displaying all requests from certain trap

uri = window.document.location.host + '/websocket'
dispatcher = new WebSocketRails(uri)
angular.module('reqApp')
.controller('TrapController', ['Trap', '$scope', '$routeParams', (Trap, $scope, $routeParams) ->
  # Get data from server
  response = Trap.get(trap_id: $routeParams.trap_id)
  response.$promise.then((data) ->
    $scope.requests = data.requests
    $scope.trapName = data.trapName
  )
  # Add new request to list through websocket
  trapChannel = dispatcher.subscribe('request')
  trapChannel.bind('new', (data)->
    $scope.requests.unshift(data)
    $scope.$apply()
  )
])