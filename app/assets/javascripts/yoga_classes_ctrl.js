/* global angular */
(function() {
  "use strict";
  angular.module("app").controller("yogaClassesCtrl",
    function($scope, $http) {
      $scope.setup = function() {
        $http.get('/api/yoga_classes.json').then(function(response) {
          $scope.yogaClasses = response.data;
        });
      };
      
      $scope.message = "Hello";

      window.$scope = $scope;
    });
})();