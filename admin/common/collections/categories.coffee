@Categories = TAPi18n.Collection 'categories',
  base_language: Meteor.settings.public.lng
  languages: Meteor.settings.public.langs

Categories.sortByLvl = (isAll = false) ->
  categories = Categories.find({}, sort: { position: -1 }).fetch()
  result = []
  sortIt = (categories, parentId, lvl) ->
    _.find categories, (category) ->
      obj =
        value: category._id
      if parentId is 0 and not category.categoryId
        obj.label = category.name
      if parentId is category.categoryId
        obj.label = Array(lvl).join('--') + category.name
      if obj.label and (category.children or isAll)
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
  name:
    type: String
    label: 'Название'
    max: 60
    i18n: true
  overview:
    type: String
    label: 'Коротко описание'
    optional: true
    custom: ->
      if not @field('children').value and not @value
        return 'required'
    i18n: true
    autoform:
      afFieldInput:
        type: 'summernote'
        class: 'editor'
        height: 150
  description:
    type: String
    label: 'Описание'
    optional: true
    custom: ->
      if not @field('children').value and not @value
        return 'required'
    i18n: true
    autoform:
      afFieldInput:
        type: 'textarea'
  img:
    label: 'Миниатюра',
    type: String,
    optional: true
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'CategoryImg'
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
  children:
    type: Boolean
    label: 'Вложенные категории'
  position:
    type: Number
    label: 'Позиция'
    autoValue: collectionAutoPosition Categories

@CategoryImg = new FS.Collection 'categoryImg', Schemas.CategoryImg

# TODO: add allow rules only for admin user group
@CategoryImg.allow
  insert: (userId) -> !!userId
  update: (userId) -> !!userId
  remove: (userId) -> !!userId
  download: () -> true
