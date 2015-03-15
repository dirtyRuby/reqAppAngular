angular.module('reqApp')
.directive('viewValue', ->
  restrict: 'E',
  templateUrl: 'assets/view-value.html',
  controller: 'RequestController',
  controllerAs: 'RequestCtrl'
)