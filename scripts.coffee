window.delay = (ms, func) ->
  setTimeout(func, ms)

$ ->

  $('div.menu-link').click (e) ->
    $(e.target).addClass('show')

  $(document).bind 'mouseup touchend', (e) ->
    container = $('div.menu-link')
    if !container.is(e.target) and (container.has(e.target).length is 0)
      container.removeClass('show')

  $('[data-href="scroll"]').click (e) ->
    $('html, body').animate
      scrollTop: $(e.currentTarget).offset().top
    , 800

  closedWidth = $("section.features > section:not(.open)").width()
  console.log closedWidth

  $('section.features > section').click (e) ->
    
    if $(e.currentTarget).hasClass('open')
      return false

    $('section.features > section').each (i, el) ->
      $(el).removeClass 'open'

    $('html, body').scrollTop $(e.currentTarget).offset().top

    $section = $(e.currentTarget)
    $section.addClass 'open'

    sectionName = $section.attr 'data-section'
    $('section.features').attr('data-section', sectionName)


  fadeIn = (screenshot) ->
    $('section.features .iphone > img').each (i, el) ->
      if $(el).attr('data-screenshot') is screenshot
        $(el).addClass 'screenshot-active'
        return
      $(el).removeClass 'screenshot-active'


  $('section.features ul a').click (e) ->
    do e.preventDefault

    screenshot = $(e.currentTarget).attr 'data-screenshot'
    $('.iphone').addClass('visible')
    fadeIn(screenshot)

    $el = $(e.currentTarget).parent()
    $list = $el.parent()

    $list.find('li').each (i, el) ->
      $(el).removeClass 'active'

    $el.addClass('active')


  $('a[data-href="close"]').click (e) ->
    $(e.currentTarget).parent().removeClass('visible')




