angular.module('reqApp')
.controller('RequestController', ['Request', '$scope', '$routeParams', (Request, $scope, $routeParams) ->
    $scope.request = Request.get(trap_id: $routeParams.trap_id, id: $routeParams.id)
  ])
