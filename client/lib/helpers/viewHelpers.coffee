Template.registerHelper 'log', (param) ->
  console.log if param? then param else @
