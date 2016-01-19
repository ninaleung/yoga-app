/* global angular */

(function() {
  "use strict";
  app.controller("yogaClassesCtrl",
    function($scope, $http, $location) {
      console.log($location.search());
      $scope.setup = function() {
        console.log('search:', getParameterByName('search'));
        console.log('studio:', getParameterByName('studio'));


        if (getParameterByName('search')) {
          console.log('hit search');
          $scope.search(getParameterByName('search'));
        } else if (getParameterByName('studio')) {
          console.log('hit studio');
          $scope.studio(getParameterByName('studio'));
        } else {
          console.log('hit no-search', $location);
          $http.get('/api/yoga_classes.json').then(function(response) {

            $scope.yogaClasses = response.data;
            $scope.maxPrice = "All";
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
          console.log(item, prop, item[prop]);
          return Number(item[prop]) < Number(val);
        };
      };

      $scope.toNumber = function(string) {
        return Number(string);
      };

      function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
          results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
      }

      $scope.message = "Hello";

      window.$scope = $scope;
      window.$location = $location;
    });
})();