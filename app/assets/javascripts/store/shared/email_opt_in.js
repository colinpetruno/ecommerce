(function(){
  ecommerce.emailOptIn = {
    cookieName: 'email-opt-in-viewed',
    target: '.email-opt-in',

    displayPopup: function () {
      if ( Cookies.get(this.cookieName) != "true" ) {
        this.showPopup();
      }
    },

    showPopup: function () {
      setupHandlers();
      $(this.target).show();
    },

    hidePopup: function () {
      Cookies.set(this.cookieName, true, { expires: 365 });
      $(this.target).hide();
    }
  }

  function setupHandlers() {
    $('body').on('click', ecommerce.emailOptIn.target + ' > div', function(e){
      e.stopPropagation();
    });

    $('body').on('click', ecommerce.emailOptIn.target, function(){
      ecommerce.emailOptIn.hidePopup();
    });

    $(document).keyup(function(e) {
      if (e.keyCode == 27) {
        ecommerce.emailOptIn.hidePopup();
      }
    });
  }
})();


$(function(){
  ecommerce.emailOptIn.displayPopup();
});


