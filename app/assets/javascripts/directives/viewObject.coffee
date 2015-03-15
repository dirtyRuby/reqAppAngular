# Directive to view complex Object.

angular.module('reqApp')
.directive('viewObject', ->
  restrict: 'E',
  templateUrl: 'assets/view-object.html',
  controller: 'RequestController',
  controllerAs: 'RequestCtrl'
)