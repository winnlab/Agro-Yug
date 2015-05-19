screens = []
$wind = $(window)
Template.main.onRendered ->
  width = do $('.team-carousel-wrap').width
  $('.team-carousel').bxSlider
    minSlides: 3
    maxSlides: 3
    slideWidth: width * 0.32
    slideMargin: width * 0.013
    controls: true
    pager: false

  getScreens = ->
    $('.slogan-box').outerHeight do $(window).height - 4.375 * $('body').css('font-size').slice 0, -2
    screens = []
    $('.j-screen').each ->
      $self = $(@)
      top = $self.offset().top - 70
      screens.push
        selector: $self
        top: top
        bottom: top + do $self.outerHeight
        title: $self.data 'title'

  do getScreens
  $wind.on 'resize', getScreens

  prevScreen = null
  $wind.on 'scroll.main', ->
    scrollTop = window.scrollY or do $wind.scrollTop
    screen = _.find screens, (screen) ->
      screen.bottom >= scrollTop + 5
    if not prevScreen or prevScreen.top isnt screen?.top
      $('#mp-menu-title').html screen.title
      prevScreen = screen

Template.main.events
  'click .j-next': (ev) ->
    do ev.preventDefault
    scrollTop = window.scrollY or do $wind.scrollTop
    screen = _.find screens, (screen) ->
      screen.top > scrollTop + 70
    $('html,body').animate
      scrollTop: screen?.top or do $('body').height
    , 300

Template.main.onDestroyed ->
  $wind.off 'scroll.main'
  $wind.off 'resize'
