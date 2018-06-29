$(document).on('turbolinks:load', function() {
  $('#components').sortable({
    update: function(event, ui) {
      perfom_component_order_calculation();
    }
  });

  $('#components').on('cocoon:after-insert', function(e, insertedItem) {
    setTimeout(function() {
      perfom_component_order_calculation();
      }, 500);
  });

  $('#components').on('click', '.collapse-icon', function(e){
    $(this).parent().parent().siblings('.component-body').toggleClass('is-hidden');
  });
});


function perfom_component_order_calculation(){
  var count = 0;
  $('.story_components_order input').each(function(){
    $(this).val(count++);
  });
  $('.event_event_photos_order input').each(function(){
    $(this).val(count++);
  });
}
