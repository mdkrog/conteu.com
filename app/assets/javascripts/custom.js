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
    $('.contents-panel').addClass('is-hidden');
    $('.'+panel_name).removeClass('is-hidden');
    // $('.panel').fadeOut(function(){
    // });
    return false;
  });
});
