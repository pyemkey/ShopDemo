$('.orders').ready(function() {
  $.externalScript('https://js.stripe.com/v1/').done(function(script, textStatus){
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
    console.log('Script loading: ' + textStatus);
    if (typeof Stripe != 'undefined') {
      console.log("OKAY");
    }
    var payment = {
      setupForm: function() {
        return $('.card_form').submit(function(){
          $('input[type=submit]').prop('disabled', true);
          if ($('#credit_card_number').length) {
            payment.processCard();
            return false;
          } else {
            return true;
          }
        });
      },
      processCard: function() {
        var card;
        card = {
          number:   $('#credit_card_number').val(),
          cvc:      $('#cvc').val(),
          expMonth: $('#card_month').val(),
          expYear:  $('#card_year').val()
        };
        return Stripe.createToken(card, payment.handleStripeResponse);
      },
      handleStripeResponse: function(status, response) {
        if (status === 200) {
          alert(response.id);
          $('#order_stripe_token').val(response.id);
          $('.card_form')[0].submit();
        } else{
          alert(response.error.message);
          return $('input[type=submit]').prop('disabled', false);
        }
      }
    };
    return payment.setupForm();
  });
});