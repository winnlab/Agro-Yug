Schemas.StaffPhoto =
  stores: [
    new FS.Store.FileSystem 'staff-photo',
      path: SchemasHelpers.fileStoresPath 'staff-photo'
  ]
  filter:
    allow:
      contentTypes: ['image/*']
