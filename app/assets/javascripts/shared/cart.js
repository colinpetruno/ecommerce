$(document).ready(function(){
  var selectors = ".sliding-panel-button,.sliding-panel-fade-screen,.sliding-panel-close";

  $('body').on('click touchstart', selectors, function(e){
    $('.sliding-panel-content,.sliding-panel-fade-screen').toggleClass('is-visible');
    e.preventDefault();
  });
});
