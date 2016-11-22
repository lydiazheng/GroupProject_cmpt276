$(document).ready(function() {
  $('.datepicker').datepicker({
    dateFormat: 'yy-mm-dd',
    minDate: 0,
  });

  var marker;
  var map;
  function initGameMap() {
    var gameLat = parseFloat($('#game_latitude').val());
    var gameLng = parseFloat($('#game_longitude').val());
    if (!gameLat) {
      gameLat = 49.283365;
      $('#game_latitude').val(gameLat);
    }
    if (!gameLng) {
      gameLng = -123.115808;
      $('#game_longitude').val(gameLng);
    }
    var loc = {lat: gameLat, lng: gameLng};
    map = new google.maps.Map(document.getElementById('map'), {
      zoom: 14,
      center: loc
    });
    marker = new google.maps.Marker({
      position: loc,
      map: map,
      draggable: true,
    });
    getLocations();

    // This event listener calls addMarker() when the map is clicked.
    google.maps.event.addListener(map, 'click', function(event) {
      addMarker(event.latLng, map);
      $('#game_latitude').val(event.latLng.lat);
      $('#game_longitude').val(event.latLng.lng);
      getLocations();
    });
  }
  window.initGameMap = initGameMap;
  // Adds a marker to the map.
  function addMarker(location, map) {
    marker.setMap(null);
    // Add the marker at the clicked location
    marker = new google.maps.Marker({
      position: location,
      map: map
    });
  }
  $('#distance').on("change paste keyup", function() {
     getLocations();
  });

  function getLocations() {
    var lat = $('#game_latitude').val();
    var lng = $('#game_longitude').val();
    var dis = $('#distance').val();
    var url = '/locations?lat=' + lat + '&lng=' + lng + '&distance=' + dis;
    $.ajax({
        type: 'GET',
        dataType: 'json',
        url: url,
        success: function(data){
          $('.js-gm-loc').removeClass('disabled');
          $(':checkbox').prop("disabled", false);

          var locationDivIds = []
          for(var i=0; i< data.length; i++) {
            locationDivIds.push('l' + data[i].id);
          }
          var locDivs = $('.js-gm-loc');
          for(var j=0; j< locDivs.length; j++) {
            var div = locDivs[j];
            if ($.inArray(div.id,locationDivIds) < 0){
              $(div).addClass('disabled')
              $(div).find(':checkbox').prop("disabled", true)
            }
          }
        }
    });
  };

});
