(function() {
  "use strict";
  angular.module("app").controller("eventsCtrl", function($scope, $http) {
    $scope.message = "hello world";
    $scope.setup = function() {
      $http.get("/api/v1/events.json").then(function(response){
        $scope.events = response.data;
      });
      $http.get("/api/v1/categories.json").then(function(response){
        $scope.categories = response.data;
      });   
      $http.get("/api/v1/user_events.json").then(function(response){
        $scope.user_events = response.data;
      });
    };

    $scope.addNewEvent = function(title, address, date, start_time, end_time, description){
      var newEvent = {
        title: title,
        date: date,
        start_time: start_time,
        end_time: end_time,
        address: address,
        description: description,
        categories: categories
      };
      http.post("/api/v1/events.json", newEvent).then(function(response){
        $scope.events.push(response.data);
      }, function(error) {
        console.log(error);
        $scope.errors = error.data.errors;
      });
    };



    });
})();