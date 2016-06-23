Router.route 'contacts',
  path: '/contacts'
  onBeforeAction: ->
    showPreloader()
    scrollToTop()
    @next()
