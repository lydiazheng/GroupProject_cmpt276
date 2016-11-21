$(document).ready(function() {
  $('#js-locations-dt').DataTable({
    columnDefs: [
      { orderable: false, targets: [-2,-1] }
    ]
  });
});

var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 49.279389, lng: -122.918836},
          zoom: 12
        });
      }

      var p1 = new google.maps.LatLng(49.279389, -122.918836);
      var p2 = new google.maps.LatLng(49.278929, -122.919163);

      //alert(calcDistance(p1, p2));

      //calculates distance between two points in m's
      function calcDistance(p1, p2) {
      var dis = (google.maps.geometry.spherical.computeDistanceBetween(p1, p2) / 1000).toFixed(2);
      return dis*1000;
      }


var Marker;
function DropPin() {
// if the previous marker exists, remove it
	if (Marker) {
    	Marker.setMap(null);
	}
	//else create a new marker
	Marker = new google.maps.Marker({
		position: map.getCenter(),
		map: map,
		draggable: true,
	});

	FillTheInput();

        // add an event 'ondrag'
	google.maps.event.addListener(Marker, 'dragend', function() {FillTheInput();});
}

function FillTheInput(){
    document.getElementById("location_latitude").value = Marker.getPosition().lat();
    document.getElementById("location_longitude").value = Marker.getPosition().lng();
}