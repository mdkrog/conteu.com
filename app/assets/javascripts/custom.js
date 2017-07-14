// prevent image selection
$(function() {
  $("img").mousedown(function(){
    return false;
  });
  $("body").on("contextmenu", "img", function(e) {
    return false;
  });

});

$(document).on('turbolinks:load', function() {


  $('.toggle-panel').on('click', function(e) {
    var panel_name = $(this).data('panel');
    $('.contents-panel').addClass('is-hidden');
    $('.'+panel_name).removeClass('is-hidden');
    return false;
  });


  // date picker
  $(function() {
    $("#datepicker").datepicker();
    $("#datepicker").on( "change", function() {
      $("#datepicker").datepicker("option", "dateFormat", "yy-mm-dd");
    });
  });


  var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
      menuRight = document.getElementById( 'cbp-spmenu-s2' ),
      contentsAngleDownIcon = document.getElementById( 'contents-angle-down-icon' ),
      contentsAngleUpIcon = document.getElementById( 'contents-angle-up-icon' ),
      body = document.body;


  $("body").on("click", "#showRightPush", function(e) {
    classie.toggle( this, 'is-active' );
    classie.toggle( contentsAngleDownIcon, 'is-hidden' );
    classie.toggle( contentsAngleUpIcon, 'is-hidden' );
    classie.toggle( body, 'cbp-spmenu-push-toleft' );
    classie.toggle( menuRight, 'cbp-spmenu-open' );
  });


  $("body").on("click", "#showLeftPush", function(e) {
    classie.toggle( this, 'is-active' );
    classie.toggle( body, 'cbp-spmenu-push-toright' );
    classie.toggle( menuLeft, 'cbp-spmenu-open' );
  });
});
