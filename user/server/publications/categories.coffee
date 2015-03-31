Meteor.publishComposite 'categoriesWithImg', (search = {}, opts = {}) ->
  find: ->
    check search, Match.Optional Object
    check opts, Match.Optional Object
    Categories.find search, opts
  children: [
    find: (category) ->
      CategoryImg.find _id: category.img
  ]
