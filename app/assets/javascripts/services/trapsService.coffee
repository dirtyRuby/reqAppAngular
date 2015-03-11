angular.module('reqApp.service')
.factory('Traps', ['$resource', ($resource) ->
  return $resource('/traps.json',  query: {method: 'GET', isArray: true})
])