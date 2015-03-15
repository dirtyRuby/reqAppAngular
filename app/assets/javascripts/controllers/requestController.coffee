# View details for certain request.

angular.module('reqApp')
.controller('RequestController', ['Request', '$scope', '$routeParams', (Request, $scope, $routeParams) ->
    response = Request.get(trap_id: $routeParams.trap_id, id: $routeParams.id)
    response.$promise.then((data)->
      $scope.request = data
    )
    $scope.valueTypeOf = (value) ->
      typeof value
  ])
