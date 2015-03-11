angular.module('reqApp.service')
.factory('Trap', ['$resource', ($resource) ->
  return $resource('/traps/:trap_id/requests.json', {trap_id: '@trap_id'}, get: {method: 'GET'})
])