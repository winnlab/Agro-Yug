Template.productPopUpPdf.events
  'click .close': ->
    $('body').removeClass 'no-overflow'
    Blaze.remove Blaze.getView document.getElementById 'pop-up-wrap'
