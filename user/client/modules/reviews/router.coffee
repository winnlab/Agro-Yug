Router.route 'reviews',
  path: '/reviews'
  onBeforeAction: ->
    showPreloader()
    scrollToTop()
    @next()
