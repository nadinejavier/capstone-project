(function() {
  "use strict";
  angular.module("app").controller("eventsCtrl", function($scope, $http) {
    $scope.message = "hello world";
     $scope.setup = function() {
      $http.get("/api/v1/events").then(function(response){
        $scope.events = response.data;
      });
    };
    
   window.$scope = $scope;

  });
}());

