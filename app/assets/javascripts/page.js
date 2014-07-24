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
    if (headerFade === false && scrollVal > 50) {
      headerFadeIn();
    }
  });

  $(window).scroll(function() {
    var scrollVal = $(this).scrollTop();
    if (headerFade === true && scrollVal < 50) {
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
    $('#side-menu').fadeToggle(1000);
  };

  $('#hamburger').click(toggleMenu);

//////////////////////////////////////////////////

  var darkenBox = function () {
    $(this).animateToggle({opacity: 0.5});
  }

  $('.box').hover(darkenBox);
  

  
// $(document).on({
//   "contextmenu": function(e) {
//     e.preventDefault();
//   },

//   "mousedown": function(e) {
//     e.preventDefault();
//   },

//   "mouseup": function(e) {
//     e.preventDefault();
//   }

// });

});

