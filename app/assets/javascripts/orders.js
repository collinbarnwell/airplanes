
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready( function() { 
  $('.datepicker').datetimepicker();
});

$("#contact").live('click',function(){
	if($(this).hasClass("selected")) {
		deselect();
	} else {
		$(this).addClass("selected");
		$.get(this.href,function(data)) {
			$(.pop).html(data).slideFadeToggle(function() {
				$("input[type=text]:first").focus();
			});
		}
	}
	return false;
});