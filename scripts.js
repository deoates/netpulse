// Generated by CoffeeScript 1.8.0
(function() {
  window.delay = function(ms, func) {
    return setTimeout(func, ms);
  };

  $(function() {
    var closedWidth, fadeIn;
    closedWidth = $("section.features > section:not(.open)").width();
    console.log(closedWidth);
    $('a.trigger').click(function(e) {
      var $section, sectionName;
      $('section.features > section').each(function(i, el) {
        return $(el).removeClass('open');
      });
      $section = $(e.currentTarget).parent();
      $section.addClass('open');
      sectionName = $section.attr('data-section');
      return $('section.features').attr('data-section', sectionName);
    });
    fadeIn = function(screenshot) {
      return $('section.features .iphone > img').each(function(i, el) {
        if ($(el).attr('data-screenshot') === screenshot) {
          $(el).addClass('screenshot-active');
          return;
        }
        return $(el).removeClass('screenshot-active');
      });
    };
    $('section.features ul a').click(function(e) {
      var $el, $list, screenshot;
      e.preventDefault();
      screenshot = $(e.currentTarget).attr('data-screenshot');
      $('.iphone').addClass('visible');
      fadeIn(screenshot);
      $el = $(e.currentTarget).parent();
      $list = $el.parent();
      $list.find('li').each(function(i, el) {
        return $(el).removeClass('active');
      });
      return $el.addClass('active');
    });
    return $('a[data-href="close"]').click(function(e) {
      return $(e.currentTarget).parent().removeClass('visible');
    });
  });

}).call(this);
