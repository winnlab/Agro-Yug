activeCategory = new ReactiveVar()
product = new ReactiveVar()

Template.productsText.helpers
  activeCategory: ->
    do activeCategory.get
  product: ->
    do product.get or false
  getImg: (_id) ->
    do ProductImg.findOne(_id)?.url
  products: ->
    Products.find categoryId: activeCategory.get()?._id

Template.productsText.events
  'click .j-link': (ev) ->
    do ev.preventDefault
    activeCategory.set @
    product.set undefined
  'click .read-more': (ev) ->
    do ev.preventDefault
    product.set @

Template.productsText.onCreated ->
  activeCategory.set @data.categories.fetch()[0]

  @autorun ->
    Meteor.subscribe 'products', categoryId: activeCategory.get()._id
