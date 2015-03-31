Router.route 'assortment',
  path: '/assortment'
  waitOn: ->
    Meteor.subscribe 'categoriesWithImg', categoryId: $exists: false
