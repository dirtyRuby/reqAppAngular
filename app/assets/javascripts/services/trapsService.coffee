angular.module('reqApp.service')
.factory('Traps', ['$resource', ($resource) ->
  return $resource('/traps.json',  query: {method: 'GET', isArray: true})
])

.factory('Trap', ['$resource', ($resource) ->
  return $resource('/traps/:trap_id/requests.json', {trap_id: '@trap_id'}, get: {method: 'GET'})
])

.factory('Request', ['$resource', ($resource) ->
  return $resource('/traps/:trap_id/requests/:id.json', {trap_id: '@trap_id', id: '@id'}, show: {method: 'GET'})
])