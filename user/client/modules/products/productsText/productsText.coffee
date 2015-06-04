activeCategory = new ReactiveVar()
product = new ReactiveVar()
productScrollTop = 0
getProductScrollTop = ->
  productScrollTop = $('.assortment').offset().top - 68

Template.productsText.helpers
  activeCategory: ->
    do activeCategory.get
  product: ->
    do product.get or false
  getImg: (_id) ->
    do ProductImg.findOne(_id)?.url
  products: ->
    Products.find categoryId: activeCategory.get()?._id, { sort: position: -1 }

Template.productsText.events
  'click .j-link': (ev) ->
    do ev.preventDefault
    activeCategory.set @
    Router.go 'products', _id: Router.current().params._id
  'click .read-more': (ev) ->
    do ev.preventDefault
    $('html,body').animate
      scrollTop: productScrollTop
    , 300
    Router.go 'products', _id: Router.current().params._id, productId: @_id

Template.productsText.onCreated ->
  unless Session.get 'products.productId'
    activeCategory.set @data.categories.fetch()[0]
  product.set undefined
  @autorun ->
    productId = Session.get 'products.productId'
    if productId
      productRecord = Products.findOne _id: productId
      product.set productRecord
      activeCategory.set Categories.findOne _id: productRecord.categoryId
    else
      product.set null

Template.productsText.onRendered ->
  do getProductScrollTop
  $(window).on 'resize.productsText', getProductScrollTop

Template.productsText.onDestroyed ->
  $(window).off 'resize.productsText'
