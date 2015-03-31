Router.route 'team',
  path: '/team'
  waitOn: ->
    Meteor.subscribe 'staff'
  data: ->
    workers: Staff.find {}, sort: position: -1
