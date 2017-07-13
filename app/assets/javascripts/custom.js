// prevent image selection
$(function() {
  $("img").mousedown(function(){
    return false;
  });
  $("body").on("contextmenu", "img", function(e) {
    return false;
  });

  $('.toggle-panel').on('click', function(e) {
    var panel_name = $(this).data('panel');
    $('.contents-panel').addClass('is-hidden');
    $('.'+panel_name).removeClass('is-hidden');
    return false;
  });
});

// date picker
$(function() {
  $("#datepicker").datepicker();
  $("#datepicker").on( "change", function() {
    $("#datepicker").datepicker("option", "dateFormat", "yy-mm-dd");
  });
});

$(function() {
  var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
      menuRight = document.getElementById( 'cbp-spmenu-s2' ),
      menuTop = document.getElementById( 'cbp-spmenu-s3' ),
      menuBottom = document.getElementById( 'cbp-spmenu-s4' ),
      showLeft = document.getElementById( 'showLeft' ),
      showRight = document.getElementById( 'showRight' ),
      showTop = document.getElementById( 'showTop' ),
      showBottom = document.getElementById( 'showBottom' ),
      showLeftPush = document.getElementById( 'showLeftPush' ),
      showRightPush = document.getElementById( 'showRightPush' ),
      contentsAngleDownIcon = document.getElementById( 'contents-angle-down-icon' ),
      contentsAngleUpIcon = document.getElementById( 'contents-angle-up-icon' ),
      showRightPush = document.getElementById( 'showRightPush' ),
      body = document.body;

  // showLeft.onclick = function() {
  //   classie.toggle( this, 'active' );
  //   classie.toggle( menuLeft, 'cbp-spmenu-open' );
  //   disableOther( 'showLeft' );
  // };
  // showRight.onclick = function() {
  //   classie.toggle( this, 'active' );
  //   classie.toggle( menuRight, 'cbp-spmenu-open' );
  //   disableOther( 'showRight' );
  // };
  // showTop.onclick = function() {
  //   classie.toggle( this, 'active' );
  //   classie.toggle( menuTop, 'cbp-spmenu-open' );
  //   disableOther( 'showTop' );
  // };
  // showBottom.onclick = function() {
  //   classie.toggle( this, 'active' );
  //   classie.toggle( menuBottom, 'cbp-spmenu-open' );
  //   disableOther( 'showBottom' );
  // };
  showLeftPush.onclick = function() {
    console.log('test');
    classie.toggle( this, 'is-active' );
    classie.toggle( body, 'cbp-spmenu-push-toright' );
    classie.toggle( menuLeft, 'cbp-spmenu-open' );
    disableOther( 'showLeftPush' );
  };
  showRightPush.onclick = function() {
    classie.toggle( this, 'is-active' );
    classie.toggle( contentsAngleDownIcon, 'is-hidden' );
    classie.toggle( contentsAngleUpIcon, 'is-hidden' );
    classie.toggle( body, 'cbp-spmenu-push-toleft' );
    classie.toggle( menuRight, 'cbp-spmenu-open' );
    disableOther( 'showRightPush' );
  };

});
function disableOther( button ) {
  // if( button !== 'showLeft' ) {
  //   classie.toggle( showLeft, 'disabled' );
  // }
  // if( button !== 'showRight' ) {
  //   classie.toggle( showRight, 'disabled' );
  // }
  // if( button !== 'showTop' ) {
  //   classie.toggle( showTop, 'disabled' );
  // }
  // if( button !== 'showBottom' ) {
  //   classie.toggle( showBottom, 'disabled' );
  // }
  if( button !== 'showLeftPush' ) {
    classie.toggle( showLeftPush, 'disabled' );
  }
  if( button !== 'showRightPush' ) {
    classie.toggle( showRightPush, 'disabled' );
  }
}
