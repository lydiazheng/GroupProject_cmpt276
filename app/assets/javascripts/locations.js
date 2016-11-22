$(document).ready(function() {
  $('#js-locations-dt').DataTable({
    columnDefs: [
      { orderable: false, targets: [-2,-1] }
    ]
  });

  var marker;
  var map;
  function initLocationMap() {
    var locLat = parseFloat($('#location_latitude').val());
    var locLng = parseFloat($('#location_longitude').val());
    if (!locLat) {
      locLat = 49.283365;
      $('#location_latitude').val(locLat);
    }
    if (!locLng) {
      locLng = -123.115808;
      $('#location_longitude').val(locLng);
    }
    var loc = {lat: locLat, lng: locLng};
    map = new google.maps.Map(document.getElementById('map'), {
      zoom: 14,
      center: loc
    });
    marker = new google.maps.Marker({
      position: loc,
      map: map,
      draggable: true,
    });

    // This event listener calls addMarker() when the map is clicked.
    google.maps.event.addListener(map, 'click', function(event) {
      addMarker(event.latLng, map);
      $('#location_latitude').val(event.latLng.lat);
      $('#location_longitude').val(event.latLng.lng);
    });
  }
  window.initLocationMap = initLocationMap;
  // Adds a marker to the map.
  function addMarker(location, map) {
    marker.setMap(null);
    // Add the marker at the clicked location
    marker = new google.maps.Marker({
      position: location,
      map: map
    });
  }
});
