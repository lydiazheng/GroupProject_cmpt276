// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.countdown
//= require bootstrap
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require_tree .

$(document).ready(function() {
  $('#password').popover();
});

var fade_flash = function() {
    $(".alert-notice").delay(5000).fadeOut(1000);
    $(".alert-alert").delay(5000).fadeOut(1000);
    $(".alert-error").delay(5000).fadeOut(1000);
    $(".alert-success").delay(5000).fadeOut(1000);
};
fade_flash();

var show_ajax_message = function(msg, type) {
    $("#flash-message").html('<div class="alert alert-'+type+'">'+msg+'</div>');
    fade_flash();
};
