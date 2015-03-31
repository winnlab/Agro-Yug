@Products = TAPi18n.Collection 'products',
  base_language: Meteor.settings.public.lng
  languages: Meteor.settings.public.langs

@ProductImg = new FS.Collection 'productImg', Schemas.ProductImg

@ProductImg.allow
  download: -> true

@ProductPdf = new FS.Collection 'productPdf', Schemas.ProductPdf

@ProductPdf.allow
  download: -> true
