uri = window.document.location.host + '/websocket'
dispatcher = new WebSocketRails(uri)
angular.module('reqApp')
.controller('TrapsController', ['Traps', '$scope', (Traps, $scope) ->
  data = Traps.query()
  $scope.traps = data
  trapsChanel = dispatcher.subscribe('trap')
  trapsChanel.bind('new', (trap)->
    $scope.traps.unshift(trap)
    $scope.$apply()
  )
])