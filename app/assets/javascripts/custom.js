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
    $('.text-panel').removeClass('center-something');
    $('#text-'+panel_name).addClass("center-something");
    $('.image-panel').removeClass('contents-image-display');
    $('#image-'+panel_name).addClass("contents-image-display");
    return false;
  });

  // admin toggle tabs
  $('.toggle-admin-tab').on('click', function(e) {
    var tab_name = $(this).data('tab');
    $('.tabs li').removeClass('is-active');
    $(this).parent().addClass('is-active');
    $('.admin-tab').addClass('is-hidden');
    $('.'+tab_name).removeClass('is-hidden');
    // return false;
  });

  // toggle-tabs based on url
  var hash = window.location.hash.substr(1);
  if(hash=='store'){
    $('.admin-tab').addClass('is-hidden');
    $('.admin-tab-2').removeClass('is-hidden');
    $('.magazine-tab').removeClass('is-active');
    $('.store-tab').addClass('is-active');
  }

  $('#product-list').sortable({
    axis: "y",
    update: function(event, ui) {
      $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });

  $('#friend-product-list').sortable({
    axis: "y",
    update: function(event, ui) {
      $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });

  // add to cart
  $('.add-to-cart').on('click', function(e) {
    console.log($(this).data('add-url'));
    $.post($(this).data('add-url'), { product_id: $(this).data('product') } );
    return false;
  });

  // date picker
  $(function() {
    $("#datepicker").datepicker();
    $("#datepicker").on( "change", function() {
      $("#datepicker").datepicker("option", "dateFormat", "yy-mm-dd");
    });
  });


  // slide menus
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
