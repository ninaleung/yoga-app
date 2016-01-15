/* global angular */

(function() {
  "use strict";
  app.controller("yogaClassesCtrl",
    function($scope, $http, $location) {
      console.log($location.search());
      $scope.setup = function() {
        if ($location.search().search) {
          $scope.search($location.search().search);
        } else {
          $http.get('/api/yoga_classes.json').then(function(response) {

            $scope.yogaClasses = response.data;
            $scope.maxPrice = 100;
          });
        }
      };

      $scope.search = function(searchTerm) {
        $http.get('/api/yoga_classes.json?search=' + searchTerm).then(function(response) {
          $scope.yogaClasses = response.data;
        });
      };
      
      $scope.lessThan = function(prop, val) {
        return function(item) {
          return item[prop] <= val;
        };
      };

      $scope.message = "Hello";

      window.$scope = $scope;
    });
})();