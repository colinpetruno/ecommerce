$(function(){
  $('.js-accordion-trigger').bind('click', function(e){
    $(this).parent().find('.submenu').slideToggle('fast');
    $(this).parent().toggleClass('is-expanded');
    e.preventDefault();
    // TODO extract this into generic
  });
});
