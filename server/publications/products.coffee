Meteor.publish 'products', (search = {}, opts = {}) ->
  check search, Match.Optional Object
  check opts, Match.Optional Object
  Products.find search, opts
