$(function(){
  function stripeResponseHandler(status, response) {
    if (response.error) {
      $form.find('.payment-errors').text(response.error.message);
      $form.find('button').prop('disabled', false);
    } else {
      var token = response.id;
      $('#credit_card_token').val(token);
      $('#new_credit_card').off("submit").submit();
    }
  }

  $('#new_credit_card').submit(function (e) {
    console.log("submitting form");
    e.preventDefault();

    var $form = $("#credit-card-form");
    $form.find("input[type=text]").prop("disabled", true);

    Stripe.card.createToken($form, stripeResponseHandler);
    return false;
  });
});
