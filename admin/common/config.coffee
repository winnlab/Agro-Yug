@AdminConfig =
  name: 'Агро Юг'
  lang: Meteor.settings.public.lng
  adminEmails: [ 'admin@admin.com' ]
  collections:
    Staff:
      icon: 'users'
      label: 'Персонал'
      tableColumns: [
        { label: 'Позиция', name: 'position' }
        { label: 'Имя', name: 'firstName' }
        { label: 'Фамилия', name: 'secondName' }
      ]
      auxCollections: [ 'StaffPhoto' ]
    Categories:
      label: 'Категории'
      showAside: false
      showWidget: false
      formRedirect: '/admin/mode/categories'
      tableColumns: [
        { label: 'Позиция', name: 'position' }
        { label: 'Название', name: 'name' }
        { label: 'Описание', name: 'description' }
      ]
      auxCollections: [ 'Categories' ]
    Products:
      label: 'Продукты'
      formRedirect: '/admin/mode/categories'
      showAside: false
      showWidget: false

AdminDashboard.addSidebarItem 'Ассортимент', AdminDashboard.path('/mode/categories'), { icon: 'list' }
