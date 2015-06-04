Router.route 'products',
  path: '/products/:_id/:productId?'
  waitOn: ->
    [
      Meteor.subscribe 'categoriesWithProducts', {
        $or: [{ _id: @params._id }, { categoryId: @params._id }]
      }
    ]
  data: ->
    category: Categories.findOne _id: @params._id
    categories: Categories.find categoryId: @params._id, { sort: position: -1 }
    productList: Products.find categoryId: @params._id, { sort: position: -1 }
  onBeforeAction: ->
    if @params.productId
      Session.set 'products.productId', @params.productId
    else
      Session.set 'products.productId', null
    do @next
