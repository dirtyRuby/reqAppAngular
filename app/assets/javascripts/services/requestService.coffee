angular.module('reqApp.service')
.factory('Request', ['$resource', ($resource) ->
  return $resource('/traps/:trap_id/requests/:id.json', {trap_id: '@trap_id', id: '@id'}, show: {method: 'GET'})
])