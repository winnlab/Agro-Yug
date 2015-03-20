Meteor.startup ->
  unless Meteor.users.findOne { username: 'admin' }
    Accounts.createUser
      username: 'admin'
      email: 'admin@admin.com'
      password: '111111'
