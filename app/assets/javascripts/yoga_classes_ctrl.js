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
          });
        }
      };

      $scope.search = function(searchTerm) {
        $http.get('/api/yoga_classes.json?search=' + searchTerm).then(function(response) {
          $scope.yogaClasses = response.data;
        });
      };
      
      $scope.message = "Hello";

      window.$scope = $scope;
    });
})();