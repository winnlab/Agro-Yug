Router.route 'about',
  path: '/about'
  onBeforeAction: ->
    showPreloader()
    scrollToTop()
    @next()
