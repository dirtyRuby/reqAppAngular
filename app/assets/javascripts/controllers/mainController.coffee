# Contains methods and variables that should be available
# in scope of any controller.

angular.module('reqApp')
.controller('MainController', ['$scope', '$location', ($scope, $location) ->
  # Change template through path
  $scope.changeView = (path) ->
    $location.path(path)
])