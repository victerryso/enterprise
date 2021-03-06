$(document).ready( function () {

// Fade the Header

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

// Resize Front Page Img and Side Menu

  $(window).resize(function() {
    $('.front-page').height($(window).height());
  });

  $(window).resize(function() {
    $('#side-menu').height($(window).height());
  });

  $('.front-page').height($(window).height());
  headerFadeOut();

  $('#side-menu').height($(window).height());
  headerFadeOut();

// Toggle Side Menu

  var toggleMenu = function() {
    $('#side-menu').fadeToggle(1000);
  };

  $('#hamburger').click(toggleMenu);

// Darken the boxes

  var $btn = $('.blackbox');
    $('#box1').mouseenter(function () {
        $btn.show();
    });

    $('.box').mouseleave(function () {
        $btn.hide();
    });


    var $btn2 = $('.blackbox2');
    $('#box2').mouseenter(function () {
        $btn2.show();
    });

    $('.box').mouseleave(function () {
        $btn2.hide();
    });

     var $btn3 = $('.blackbox3');
    $('#box3').mouseenter(function () {
        $btn3.show();
    });

    $('.box').mouseleave(function () {
        $btn3.hide();
    });


    var $btn4 = $('.blackbox4');
    $('#box4').mouseenter(function () {
        $btn4.show();
    });

    $('.box').mouseleave(function () {
        $btn4.hide();
    });

// Disable Right-Click

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

