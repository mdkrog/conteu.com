$(function() {
  $('#components').sortable({
    update: function(event, ui) {
      perfom_component_order_calculation();
    }
  });

  $('#sortable').on('cocoon:after-insert', function(e, insertedItem) {
    perfom_component_order_calculation();
  });

  $('#components').on('click', '.collapse-icon', function(e){
    $(this).parent().siblings('.component-body').toggleClass('is-hidden');
  });
});


function perfom_component_order_calculation(){
  var count = 0;
  $('.story_components_order input').each(function(){
    $(this).val(count++);
  });
}
