
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  $('input.datepicker').datepicker();
  $('.close-btn').click( function() {
  	$('#big-box').fadeOut();
  });
});
