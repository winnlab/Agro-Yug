Template.layout.onRendered ->
  $wind = $(window)
  $header = $('header')
  $wind.on 'scroll', ->
    scrollTop = @scrollY or do $wind.scrollTop
    if scrollTop > 150 and not $header.hasClass 'small'
      $header.addClass 'small'
    if scrollTop < 150 and $header.hasClass 'small'
      $header.removeClass 'small'

Template.layout.events
  'click .menu': (ev, tpl)->
    tpl.$('header').removeClass 'small'
  'click .leave-offer': (ev) ->
    do ev.preventDefault
    $('body').addClass 'no-overflow'
    Blaze.render Template.popUpCoopOffer, document.body
