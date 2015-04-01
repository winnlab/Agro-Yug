@adminProducts =
  type: new ReactiveVar 'text'
  getType: (categoryId) ->
    if categoryId then Categories.findOne(categoryId).type else 'text'
  rendered: ->
    category = adminProducts.getType do @$('select[name="categoryId"]').val
    adminProducts.type.set category
  helpers:
    type: -> do adminProducts.type.get
    productOmitFields: ->
      type = do adminProducts.type.get
      settings = Meteor.settings.public
      langs = _.filter settings.langs, (lang) -> lang isnt settings.lng
      text = [ 'overview', 'description' ]
      pdf = [ 'pdf' ]
      skip = []

      if type is 'pdf'
        _.each text, (item) ->
          _.each langs, (lang) ->
            skip.push item, "i18n.#{lang}.#{item}"

      if type is 'text'
        skip = pdf

      skip.join ','
  events:
    'change select[name="categoryId"]': (e, t) ->
      adminProducts.type.set adminProducts.getType e.target.value

Template.adminProductsNew.onRendered adminProducts.rendered
Template.adminProductsNew.helpers adminProducts.helpers
Template.adminProductsNew.events adminProducts.events

Template.adminProductsEdit.onRendered adminProducts.rendered
Template.adminProductsEdit.helpers adminProducts.helpers
Template.adminProductsEdit.events adminProducts.events
