uri = window.document.location.host + '/websocket'
dispatcher = new WebSocketRails(uri)
angular.module('reqApp')
.controller('TrapsController', ['Traps', '$scope', (Traps, $scope) ->
  data = Traps.get()
  trapsChanel = dispatcher.subscribe('traps')
  trapsChanel.bind('new', (trap)->
    data.traps.unshift(trap)
  )
  $scope.traps = data
])