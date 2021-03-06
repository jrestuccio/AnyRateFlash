// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require_tree .


// Initialize jQuery
var ready;
ready = function() {

	//Navbar collapse load
	$(".button-collapse").sideNav();

	//Parallax scrolling load
	$('.parallax').parallax();

	// Scrollspy scrolling tracking
	$('.scrollspy').scrollSpy();

	// to make matrailize's select work
	$('select').material_select();

	// collapsable
	$('.collapsible').collapsible({
      		accordion : false  
    });

    // dismiss the popup
	$('.modal-trigger').leanModal({
    	dismissible : true
  	});

  	$('.datepicker').pickadate({
    	selectMonths: true, // Creates a dropdown to control month
    	selectYears: 15, // Creates a dropdown of 15 years to control year
    	format: 'mm/dd/yyyy'   	
  	});


 



};(jQuery);

$(document).ready(ready);
$(document).on('page:load', ready);





// (function($){
// 	$(function(){
// 		//Navbar collapse load
// 		$(".button-collapse").sideNav();

// 		//Parallax scrolling load
// 		$('.parallax').parallax();

// 		// Scrollspy scrolling tracking
// 		$('.scrollspy').scrollSpy();

// 		// to make matrailize's select work
// 		$('select').material_select();
// 	}); // end of document ready
// })(jQuery); 


