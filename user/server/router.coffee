# fs = Npm.require 'fs'
# Router.route('/pdfviewer/:_id', { where: 'server' })
#   .get ->
#     pdf = ProductPdf.findOne @params._id
#     pathToPDF = SchemasHelpers.fileStoresPath('product-pdf') + '/' + pdf.copies['product-pdf'].key
#     response = @response
#     fs.readFile pathToPDF, (err, data) ->
#       response.writeHead 200, { 'Content-Type': 'application/pdf' }
#       response.end data
