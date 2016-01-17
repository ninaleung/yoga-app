/* global angular */

(function() {
  "use strict";
  app.controller("yogaClassesCtrl",
    function($scope, $http, $location) {
      console.log($location.search());
      $scope.setup = function() {
        if ($location.search().search) {
          $scope.search($location.search().search);
        } else if ($location.search().studio) {
          $scope.studio($location.search().studio);
        } else {
          $http.get('/api/yoga_classes.json').then(function(response) {

            $scope.yogaClasses = response.data;
            $scope.maxPrice = 1000;
          });
        }
      };

      $scope.search = function(searchTerm) {
        console.log(searchTerm);
        $http.get('/api/yoga_classes.json?search=' + searchTerm).then(function(response) {
          $scope.yogaClasses = response.data;
        });
      };
      
      $scope.studio = function(searchTerm) {
        $http.get('/api/yoga_classes.json?studio=' + searchTerm).then(function(response) {
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