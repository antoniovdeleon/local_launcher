// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(function() {
  
  $('.follow').on('click', function() {
    var $star = $(this).find('.glyphicon');
    $star.removeClass('glyphicon-star-empty').addClass('glyphicon-star');

    // POST request to server to create favorite in db
    $.post('/follows', {
      follow: { business_id: $(this).attr('data-id') }
    },
    function(data) {
      console.log(data);
    });
  });

});