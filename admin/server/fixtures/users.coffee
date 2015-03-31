Meteor.startup ->
  unless Meteor.users.findOne { username: 'admin' }
    Accounts.createUser
      username: Meteor.settings.admin.username
      email: Meteor.settings.admin.email
      password: Meteor.settings.admin.pwd
