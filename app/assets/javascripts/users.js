$(document).ready(function() {
  $('#js-users-dt').DataTable({
    columnDefs: [
      { orderable: false, targets: -1 }
    ]
  });
});

