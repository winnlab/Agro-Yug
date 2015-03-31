Schemas.ProductImg =
  stores: [
    new FS.Store.FileSystem 'product-img',
    path: SchemasHelpers.fileStoresPath 'product-img'
  ]
  filter:
    allow:
      contentTypes: ['image/*']

Schemas.ProductPdf =
  stores: [
    new FS.Store.FileSystem 'product-pdf',
      path: SchemasHelpers.fileStoresPath 'product-pdf'
  ]
  filter:
    allow:
      contentTypes: ['application/pdf']
