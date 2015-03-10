angular.module('reqApp')
.controller('MainController', ['$scope', '$location', ($scope, $location) ->
  $scope.changeView = (path) ->
    $location.path(path)
  $scope.backPath = ->
    $window.history.back()
])