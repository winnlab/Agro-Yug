Router.configure
  layoutTemplate: 'layout'
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

  Router.onAfterAction ->
    $('#preloader').stop(true, true).fadeOut 300

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
