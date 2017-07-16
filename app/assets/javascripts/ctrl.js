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

    function initMap(events) {
      var geocoder = new google.maps.Geocoder();
      var map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: -34.397, lng: 150.644},
        zoom: 8
      });
      var markers = [];
      var bounds = new google.maps.LatLngBounds();
      events.forEach(function(event) {
        console.log(event);
        geocoder.geocode({address: event.address}, function(results, status) {
          if (status === google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              position: results[0].geometry.location,
              map: map,
              title: "event!"
            });
            markers.push(marker);
            for (var i = 0;i < markers.length; i++) {
              bounds.extend(markers[i].getPosition());
            }
            map.fitBounds(bounds);
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      });
    }

    


    });
})();