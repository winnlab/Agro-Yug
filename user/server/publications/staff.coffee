Meteor.publishComposite 'staff', (search = {}, opts = {}) ->
  find: ->
    check search, Match.Optional Object
    check opts, Match.Optional Object
    Staff.find search, opts
  children: [
    find: (staff) ->
      StaffPhoto.find _id: staff.photo
  ]
