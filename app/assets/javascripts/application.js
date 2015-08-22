//= require jquery
//= require jquery_ujs
//= require jquery.slick
//= require_tree .

$(function(){
  // TODO: Move to config
  Stripe.setPublishableKey('pk_test_AMAki3ck6bYEcahM8uuzytKe');
  $('.carousel > div').slick({ dots: true });
});
