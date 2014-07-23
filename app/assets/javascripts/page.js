$(document).ready( function () {

  var headerFade = false

  var headerFadeIn = function () {
    $('header').animate({opacity: 1}, 1000);
    headerFade = true;
  };

  var headerFadeOut = function () {
    $('header').animate({opacity: 0.5}, 1000);
    headerFade = false;
  };

  $(window).scroll(function() {
    var scrollVal = $(this).scrollTop();
    if (headerFade === false && scrollVal > 300) {
      headerFadeIn();
    }
  });

  $(window).scroll(function() {
    var scrollVal = $(this).scrollTop();
    if (headerFade === true && scrollVal < 300) {
      headerFadeOut();
    }
  });

//////////////////////////////////////////////////

  $(window).resize(function() {
    $('.front-page').height($(window).height());
  });

  $('.front-page').height($(window).height());
  headerFadeOut();

//////////////////////////////////////////////////

  var toggleMenu = function() {
    $('#side-menu').slideToggle(1000);
  };

  $('#hamburger').click(toggleMenu);

//////////////////////////////////////////////////



});

