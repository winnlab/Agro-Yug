Router.route 'products',
  path: '/products/:_id'
  waitOn: ->
    [
      Meteor.subscribe 'categoriesWithImg', {
        $or: [{ _id: @params._id }, { categoryId: @params._id }]
      }
      Meteor.subscribe 'products', { categoryId: @params._id }
    ]
  data: ->
    category: Categories.findOne _id: @params._id
    categories: Categories.find categoryId: @params._id
    productList: Products.find categoryId: @params._id
