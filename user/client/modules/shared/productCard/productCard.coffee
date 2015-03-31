Template.productCard.helpers
  getImage: (_id) ->
    if @type
      do CategoryImg.findOne(_id).url
    else
      do ProductImg.findOne(_id).url

Template.productCard.events
  'click .product-details': ->
    $('body').addClass 'no-overflow'
    pdf = ProductPdf.findOne @pdf
    Blaze.renderWithData Template.productPopUpPdf, { pdf, name: @name }, document.body
