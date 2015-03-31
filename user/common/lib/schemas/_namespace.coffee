@Schemas = {}

@SchemasHelpers =
  fileStoresPath: (folder) ->
    if Meteor.isServer
      path = Npm.require "path"
      path.normalize "#{process.env.PWD}/../files/#{folder}"
    else
      folder
