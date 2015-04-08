Template.productCard.helpers
  getImage: (_id) ->
    if @type
      do CategoryImg.findOne(_id)?.url
    else
      do ProductImg.findOne(_id)?.url

Template.productCard.events
  'click .product-details': ->
    pdf = ProductPdf.findOne @pdf
    UIpopUp.show
      tmpl: Template.productPopUpPdf
      data: { pdf, name: @name }
