$(function(){
  $('.js-cart').on('click', '.edit_order_item input[type=submit]', function () {
    var $container = $(this).closest('div').parent();
    $container.find(".order-item-quantities").hide();
    $container.find(".spinner").show();
  });
});
