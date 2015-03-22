# View details for certain request.

angular.module('reqApp')
.controller('RequestController', ['Request', '$scope', '$stateParams', (Request, $scope, $stateParams) ->
    response = Request.get(trap_id: $stateParams.trap_id, id: $stateParams.id)
    response.$promise.then((data)->
      $scope.request = data
    )
    $scope.valueTypeOf = (value) ->
      typeof value
  ])
