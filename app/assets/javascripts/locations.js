$(document).ready(function() {
  $('#js-locations-dt').DataTable({
    columnDefs: [
      { orderable: false, targets: [-2,-1] }
    ]
  });
});
