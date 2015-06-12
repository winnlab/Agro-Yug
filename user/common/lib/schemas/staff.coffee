Schemas.StaffPhoto =
  stores: [
    new FS.Store.FileSystem 'staff-photo',
    path: SchemasHelpers.fileStoresPath 'staff-photo'
    transformWrite: (fileObj, readStream, writeStream) ->
      gm(readStream, fileObj.name()).stream().pipe writeStream
  ]
  filter:
    allow:
      contentTypes: ['image/*']
