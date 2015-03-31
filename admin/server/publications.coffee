Meteor.publishComposite 'categories', (search = {}, opts = {}) ->
  find: ->
    check search, Match.Optional Object
    check opts, Match.Optional Object
    Categories.find search, opts
  children: [
    find: (category) ->
      CategoryImg.find _id: category.img
  ]

Meteor.publishComposite 'products', (search = {}, opts = {}) ->
  find: ->
    check search, Match.Optional Object
    check opts, Match.Optional Object
    Products.find search, opts
  children: [
    find: (product) ->
      ProductImg.find _id: product.img
  ,
    find: (product) ->
      ProductPdf.find _id: product.pdf
  ]
