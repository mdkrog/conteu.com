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
    console.log(panel_name);
    $('.panel').addClass('hide');
    $('.'+panel_name).removeClass('hide');
    // $('.panel').fadeOut(function(){
    // });
    return false;
  });
});
