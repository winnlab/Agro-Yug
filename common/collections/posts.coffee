@Posts = new Mongo.Collection 'posts'

@Posts.attachSchema
  name:
    type: String
    label: 'Название'
