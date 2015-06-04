Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  i18n:
    defaultLanguage: Meteor.settings.public.lng
    langCodeForDefaultLanguage: false
    languages: Meteor.settings.public.langs
    autoConfLanguage: true
    exclude:
      api: '\/api'

if Meteor.isClient
  Router.before ->
    language = do Router.getLanguage
    TAPi18n.setLanguage language if TAPi18n.getLanguage() isnt language
    do @next
  Router.onBeforeAction ->
    unless Router.current().url.indexOf 'products' > -1
      $('html,body').animate
        scrollTop: 0
      , 300
    do @next

Router.route('pdfviewer', {
  path: '/api/pdfviewer/:_id'
  where: 'server'
  i18n:
    exclude: true
}).get ->
  fs = Npm.require 'fs'
  pdf = ProductPdf.findOne @params._id
  pathToPDF = SchemasHelpers.fileStoresPath('product-pdf') + '/' + pdf.copies['product-pdf'].key
  response = @response
  fs.readFile pathToPDF, (err, data) ->
    response.writeHead 200, { 'Content-Type': 'application/pdf' }
    response.end data
