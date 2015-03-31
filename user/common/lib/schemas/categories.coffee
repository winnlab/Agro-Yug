Schemas.CategoryImg =
  stores: [
    new FS.Store.FileSystem 'category-img',
      path: SchemasHelpers.fileStoresPath 'category-img'
  ]
  filter:
    allow:
      contentTypes: ['image/*']
