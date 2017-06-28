(function() {
  "use strict";
  angular.module("app").controller("ctrl", function($scope, $http) {
    $scope.setup = function() {
      $http.get("/api/v1/events").then(function(response){
        $scope.events = response.data;
      });
      $http.get("/api/v1/categories.json").then(function(response){
        $scope.categories = response.data;
      });
    };



    });
})();