(function() {
  $(function() {
    $('body').prepend('<div id="fb-root"></div>');
    return $.ajax({
      url: "" + window.location.protocol + "//connect.facebook.net/en_US/all.js",
      dataType: 'script',
      cache: true
    });
  });

  window.fbAsyncInit = function() {
    FB.init({
      appId: '1439211939631984',
      cookie: true
    });
    $('#sign_in').click(function(e) {
      e.preventDefault();
      return FB.login(function(response) {
        if (response.authResponse) {
          return window.location = '/auth/facebook/callback?' + $.param({ signed_request: response.authResponse.signedRequest });
        }
      }, {scope: 'email'});
    });
    return $('#sign_out').click(function(e) {
      FB.getLoginStatus(function(response) {
        if (response.authResponse) {
          return FB.logout();
        }
      });
      return true;
    });
  };

}).call(this);