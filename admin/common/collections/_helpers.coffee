@collectionAutoPosition = (Collection) ->
  ->
    position = @field('position').value
    return position if position or position is 0
    item = Collection.find({}, { sort: { position: -1 }, limit: 1 }).fetch()[0]
    if item?.position then item?.position + 1 else 1
