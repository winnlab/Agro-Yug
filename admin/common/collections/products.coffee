@Products = TAPi18n.Collection 'products',
  base_language: Meteor.settings.public.lng
  languages: Meteor.settings.public.langs

Products.attachI18nSchema
  categoryId:
    type: String
    label: 'Категория'
    regEx: SimpleSchema.RegEx.Id
    autoform:
      type: 'select'
      options: -> Categories.sortByLvl true
  name:
    type: String
    label: 'Название'
    max: 60
    i18n: true
  overview:
    type: String
    label: 'Краткий обзор'
    optional: true
    i18n: true
    autoform:
      afFieldInput:
        type: 'summernote',
        class: 'editor'
        height: 125
  description:
    type: String
    optional: true
    label: 'Описание'
    i18n: true
    autoform:
      afFieldInput:
        type: 'summernote',
        class: 'editor'
        height: 400
  img:
    label: 'Изображение'
    type: String
    optional: true
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'ProductImg'
  pdf:
    label: 'PDF-документ'
    type: String
    optional: true
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'ProductPdf'
  position:
    type: Number
    label: 'Позиция'
    autoValue: collectionAutoPosition Products

@ProductImg = new FS.Collection 'productImg', Schemas.ProductImg

# TODO: add allow rules only for admin user group
@ProductImg.allow
  insert: (userId) -> !!userId
  update: (userId) -> !!userId
  remove: (userId) -> !!userId
  download: () -> true

@ProductPdf = new FS.Collection 'productPdf', Schemas.ProductPdf

# TODO: add allow rules only for admin user group
@ProductPdf.allow
  insert: (userId) -> !!userId
  update: (userId) -> !!userId
  remove: (userId) -> !!userId
  download: () -> true
