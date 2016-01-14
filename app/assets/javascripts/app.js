var app;
(function() {
  "use strict";

  app = angular.module("app", []);

  app.config(function( $locationProvider) {
    // enable html5Mode for pushstate ('#'-less URLs)
    $locationProvider.html5Mode({
      enabled: true,
      requireBase: false
    });

  });

}());