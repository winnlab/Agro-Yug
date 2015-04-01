@Staff = TAPi18n.Collection 'staff',
  base_language: Meteor.settings.public.lng
  languages: Meteor.settings.public.langs

@Staff.attachI18nSchema
  firstName:
    type: String
    label: 'Имя'
    max: 30
    i18n: true
  secondName:
    type: String
    label: 'Фамилия'
    max: 30
    i18n: true
  info:
    type: String
    label: 'Дополнительная информация'
    i18n: true
    autoform:
      afFieldInput:
        type: 'summernote'
        class: 'editor'
        height: 200
  photo:
    label: 'Фото сотрудника'
    type: String
    optional: true
    autoform:
      afFieldInput:
        type: 'fileUpload'
        collection: 'StaffPhoto'
  position:
    type: Number
    label: 'Позиция'
    autoValue: collectionAutoPosition Staff

@Staff.allow
  insert: (userId) -> true
  update: (userId) -> true
  remove: (userId) -> true
  fetch: ['name']

@StaffPhoto = new FS.Collection 'staffPhoto', Schemas.StaffPhoto

# TODO: add allow rules only for admin user group
@StaffPhoto.allow
  insert: (userId) -> !!userId
  update: (userId) -> !!userId
  remove: (userId) -> !!userId
  download: () -> true
