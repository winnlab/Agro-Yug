Template.registerHelper 'log', (param) ->
  if typeof param is 'string'
    console.log @[param]
  else
    console.log if param? then param else @
