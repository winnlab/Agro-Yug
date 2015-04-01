callbackHooks = (collection, insertDoc, updateDoc, currentDoc) ->
  unless collection is 'Categories' or collection is 'Products'
    Router.go "/admin/#{collection}"
  Router.go "/admin/mode/categories" +
    if currentDoc?.categoryId then "/#{currentDoc?.categoryId}" else ""
  return false

@AdminConfig =
  name: 'Агро Юг'
  lang: Meteor.settings.public.lng
  adminEmails: [ 'admin@admin.com' ]
  callbacks:
    onInsert: callbackHooks
    onUpdate: callbackHooks
  collections:
    Staff:
      icon: 'users'
      label: 'Персонал'
      order: [[0, "desc"]]
      tableColumns: [
        { label: 'Позиция', name: 'position' }
        { label: 'Имя', name: 'firstName' }
        { label: 'Фамилия', name: 'secondName' }
      ]
      auxCollections: [
        collection: 'Staff'
        fields: position: 1
      ,
        'StaffPhoto'
      ]
    Categories:
      label: 'Ассортимент'
      showAside: false
      url: '/admin/mode/categories'
      tableColumns: [
        { label: 'Позиция', name: 'position' }
        { label: 'Название', name: 'name' }
        { label: 'Описание', name: 'description' }
      ]
      auxCollections: [ 'Categories' ]
    Products:
      label: 'Продукты'
      showAside: false
      showWidget: false
    Users:
      showAside: false
      showWidget: false

AdminDashboard.addSidebarItem 'Ассортимент', AdminDashboard.path('/mode/categories'), { icon: 'list' }
