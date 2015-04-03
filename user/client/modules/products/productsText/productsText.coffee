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
    product.set undefined
  'click .read-more': (ev) ->
    do ev.preventDefault
    $('html,body').animate
      scrollTop: productScrollTop
    , 300
    product.set @

Template.productsText.onCreated ->
  activeCategory.set @data.categories.fetch()[0]

  @autorun ->
    Meteor.subscribe 'products', categoryId: activeCategory.get()._id


Template.productsText.onRendered ->
  do getProductScrollTop
  $(window).on 'resize.productsText', getProductScrollTop

Template.productsText.onDestroyed ->
  $(window).off 'resize.productsText'
