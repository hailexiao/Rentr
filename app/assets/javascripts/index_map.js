var map;

function initMap() {
  var mapOptions = {
   zoom: 12,
   center: {lat: 42.3515662, lng: -71.0613815},
   mapTypeId: google.maps.MapTypeId.TERRAIN
  };

  map = new google.maps.Map(document.getElementById('map'),
       mapOptions);

  var unit_markers = [];
  var infowindows = [];
  var unit = {};
  var window_content;

  for (var i in gon.rental_units) {
    unit = {lat: gon.rental_units[i].latitude,
                     lng: gon.rental_units[i].longitude};

    window_content = '<a href="/rental_units/' + gon.rental_units[i].id + '">' + gon.rental_units[i].address +
      '</a>';

    infowindows[i] = new google.maps.InfoWindow({
      content: window_content
    });

    unit_markers[i] = new google.maps.Marker({
      position: unit,
      map: map,
      animation: google.maps.Animation.DROP,
      title: gon.rental_units[i].address,
      infowindow: infowindows[i]
    });

    google.maps.event.addListener(unit_markers[i], 'click', function() {
      this.infowindow.open(map, this);
    });

  }

}
