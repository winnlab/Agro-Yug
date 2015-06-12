Schemas.CategoryImg =
  stores: [
    new FS.Store.FileSystem 'category-img',
    path: SchemasHelpers.fileStoresPath 'category-img'
    transformWrite: (fileObj, readStream, writeStream) ->
      gm(readStream, fileObj.name()).stream().pipe writeStream
  ]
  filter:
    allow:
      contentTypes: ['image/*']
