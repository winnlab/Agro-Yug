Meteor.publish 'categories', (search = {}, opts = {}) ->
  check search, Match.Optional Object
  check opts, Match.Optional Object
  Categories.find search, opts
