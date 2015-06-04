Meteor.publishComposite 'categoriesWithImg', (search = {}, opts = {}) ->
  find: ->
    check search, Match.Optional Object
    check opts, Match.Optional Object
    Categories.find search, opts
  children: [
    find: (category) ->
      CategoryImg.find _id: category.img
  ]

Meteor.publishComposite 'categoriesWithProducts', (search = {}, opts = {}) ->
  find: ->
    check search, Match.Optional Object
    check opts, Match.Optional Object
    Categories.find search, opts
  children: [
    find: (category) ->
      CategoryImg.find _id: category.img
  ,
    find: (category) ->
      Products.find { categoryId: category._id }, { sort: position: -1 }
    children: [
      find: (product) ->
        ProductImg.find _id: product.img
    ,
      find: (product) ->
        ProductPdf.find _id: product.pdf
    ]
  ]
