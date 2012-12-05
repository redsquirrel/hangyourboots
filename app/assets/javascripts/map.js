var Map = {
  dbcAddress: "717 California St, San Francisco, CA 94108",

  init: function() {
    this.calcRoute();
  },

  drawMap: function() {
    var mapCanvas = $('#map_canvas')[0];
    var mapOptions = {
      zoom: 13,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    return new google.maps.Map(mapCanvas, mapOptions);
  },

  calcRoute: function() {
    var start = this.dbcAddress,
        end = $('#address').html(),
        directionsDisplay = new google.maps.DirectionsRenderer(),
        directionsService = new google.maps.DirectionsService(),
        request = {
        origin: start,
        destination: end,
        travelMode: google.maps.DirectionsTravelMode.DRIVING
    };

    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
      }
    });
    directionsDisplay.setMap(this.drawMap());
  }

};
