Router.route 'manufacturers',
  path: '/manufacturers'
  onBeforeAction: ->
    showPreloader()
    scrollToTop()
    @next()
