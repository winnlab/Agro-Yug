Router.route 'main',
  path: '/'
  waitOn: ->
    [
      Meteor.subscribe 'categoriesWithImg', categoryId: $exists: false
      Meteor.subscribe 'staff'
    ]
  data: ->
    workers: Staff.find {}, sort: position: -1
  onBeforeAction: ->
    showPreloader()
    scrollToTop()
    @next()
