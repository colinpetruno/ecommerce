//= require namespace
//= require jquery
//= require jquery_ujs
//= require jquery.slick
//= require js-cookie
//= require_tree ./checkout
//= require_tree ./shared
//= require_tree ./store

$(function(){
  // TODO: Move to config
  if(Stripe) {
    Stripe.setPublishableKey('pk_test_AMAki3ck6bYEcahM8uuzytKe');
    $('.carousel > div').slick({ dots: true });
  }
});
