angular.module('reqApp')
.controller('TrapController', ['Trap', '$scope', '$routeParams', (Trap, $scope, $routeParams) ->
  $scope.data = Trap.get(trap_id: $routeParams.trap_id)
])