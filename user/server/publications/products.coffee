Meteor.publishComposite 'products', (search = {}, opts = {}) ->
  find: ->
    check search, Match.Optional Object
    check opts, Match.Optional Object
    Products.find search, opts
    # do Products.find
  children: [
    find: (product) ->
      ProductImg.find _id: product.img
  ,
    find: (product) ->
      ProductPdf.find _id: product.pdf
  ]
