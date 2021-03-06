categoriesFields = { _id: 1, name: 1, categoryId: 1, position: 1, type: 1, children: 1 }

Router.route 'adminCategoriesNew',
  path: AdminDashboard.path 'custom/categories/new/:_id?'
  controller: 'AdminController'
  template: 'AdminDashboardNew'
  waitOn: ->
    Meteor.subscribe 'categories', {}, {
      fields: categoriesFields
    }
  data: ->
    admin_collection: adminCollectionObject 'Categories'
  onAfterAction: ->
    Session.set 'admin_collection_name', 'Categories'
    Session.set 'admin_title', 'Категория'
    Session.set 'admin_subtitle', 'Создать'

Router.route 'adminCategoriesEdit',
  path: AdminDashboard.path 'custom/categories/edit/:categoryId?'
  controller: 'AdminController'
  template: 'AdminDashboardEdit'
  waitOn: ->
    [
      Meteor.subscribe 'categories', { _id: @params.categoryId }
      Meteor.subscribe 'categories', {}, {
        fields: categoriesFields
      }
    ]
  data: ->
    admin_collection: adminCollectionObject 'Categories'
  onAfterAction: ->
    category = Categories.findOne _id : @params.categoryId
    Session.set 'admin_collection_name', 'Categories'
    Session.set 'admin_doc', category
    Session.set 'admin_id', @params.categoryId
    Session.set 'admin_title', 'Категория'
    Session.set 'admin_subtitle', "Изменить #{category?.name}"

Router.route 'adminCategoriesList',
  path: AdminDashboard.path 'mode/categories/:_id?'
  controller: 'AdminController'
  waitOn: ->
    find = '$or': [
      { categoryId: if @params._id then @params._id else '$exists': false },
    ]
    if @params._id
      find.$or.push { _id: @params._id }

    [
      Meteor.subscribe 'categories', find,
        {
          fields: categoriesFields
        }
      Meteor.subscribe 'products', { categoryId: @params._id }, {
        fields: { name: 1, position: 1, img: 1, pdf: 1 }
      }
    ]
  data: ->
    currentId: @params._id
    category: if @params._id then Categories.findOne @params._id else null
    categories: Categories.find {}, sort: { position: -1 }
    products: Products.find {}, sort: { position: -1 }
  onAfterAction: ->
    title = 'Все категории'
    if @params?._id
      category = Categories.findOne(@params._id)
      title = "Категория: " + if category then category.name else ''
    Session.set 'admin_title', title

Router.route 'adminProductsNew',
  path: AdminDashboard.path 'custom/products/new/:_id?'
  controller: 'AdminController'
  template: 'adminProductsNew'
  waitOn: ->
    Meteor.subscribe 'categories', {}, {
      fields: categoriesFields
    }
  data: ->
    admin_collection: adminCollectionObject 'Products'
  onAfterAction: ->
    Session.set 'admin_collection_name', 'Products'
    Session.set 'admin_title', 'Продукт'
    Session.set 'admin_subtitle', 'Создать'

Router.route 'adminProductsEdit',
  path: AdminDashboard.path 'custom/products/edit/:productId?'
  controller: 'AdminController'
  template: 'adminProductsEdit'
  waitOn: ->
    [
      Meteor.subscribe 'products', { _id: @params.productId }
    ,
      Meteor.subscribe 'categories', {}, {
        fields: categoriesFields
      }
    ]
  data: ->
    admin_collection: adminCollectionObject 'Products'
  onAfterAction: ->
    product = Products.findOne _id : @params.productId
    Session.set 'admin_collection_name', 'Products'
    Session.set 'admin_doc', product
    Session.set 'admin_id', @params.productId
    Session.set 'admin_title', 'Продукт'
    Session.set 'admin_subtitle', "Изменить #{product?.name}"
