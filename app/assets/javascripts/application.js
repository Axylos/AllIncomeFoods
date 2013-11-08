// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.mobile
//= require_tree .
//= require_self

// TODO learn why lazy-render, render-functions, and yqlgeo are used
//
// TODO learn what this is doing
$(document).ready(function(){
  var addressPrompt = $('#addressfield').val();
  $('#addressfield').focus(function(){
    if ($('#addressfield').val()==addressPrompt) {
      $('#addressfield').empty()
    }
  });
  $("#locateme").click(function() {
    initiate_geolocation();
  });
};