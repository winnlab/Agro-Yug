@Categories = TAPi18n.Collection 'categories',
  base_language: Meteor.settings.public.lng
  languages: Meteor.settings.public.langs

Categories.sortByLvl = ->
  categories = Categories.find({}, sort: { position: 1 }).fetch()
  result = []
  sortIt = (categories, parentId, lvl) ->
    _.find categories, (category) ->
      obj =
        value: category._id
      if parentId is 0 and not category.categoryId
        obj.label = category.name
      if parentId is category.categoryId
        obj.label = Array(lvl).join('--') + category.name
      if obj.label
        obj.selected = true if Router.current().params?._id is category._id
        result.push obj
        sortIt categories, category._id, lvl + 1
  sortIt categories, 0, 1
  return result

Categories.attachI18nSchema
  categoryId:
    type: String
    label: 'Родительская категория'
    regEx: SimpleSchema.RegEx.Id
    optional: true
    autoform:
      type: 'select'
      options: Categories.sortByLvl
  type:
    type: String
    label: 'Тип продуктов'
    allowedValues: [ 'text', 'pdf' ]
    autoform:
      noselect: true
      options: [
        { label: "Продукты с описанием", value: "text" }
        { label: "Продукты с pdf", value: "pdf" }
      ]
  position:
    type: Number
    label: 'Позиция'
  name:
    type: String
    label: 'Название'
    max: 30
    i18n: true
  description:
    type: String
    label: 'Описание'
    i18n: true
    autoform:
      afFieldInput:
        type: 'textarea'
  img:
    label: 'Миниатюра',
    type: String,
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'CategoryImg'

@CategoryImg = new FS.Collection 'categoryImg',
    stores: [
      new FS.Store.FileSystem 'category-img', {}
    ]
    filter:
      allow:
        contentTypes: ['image/*']

# TODO: add allow rules only for admin user group
@CategoryImg.allow
  insert: (userId) -> !!userId
  update: (userId) -> !!userId
  remove: (userId) -> !!userId
  download: () -> true
