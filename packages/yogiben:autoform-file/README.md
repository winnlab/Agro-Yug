Autoform File
=============

### Description ###
Upload and manage files with autoForm.

![Meteor autoform file](https://raw.githubusercontent.com/yogiben/meteor-autoform-file/master/readme/1.png)

### Quick Start ###
1) Install `meteor add yogiben:autoform-file`

2) Create your collectionFS (See [collectionFS](https://github.com/CollectionFS/Meteor-CollectionFS))
```
@Images = new FS.Collection("images",
  stores: [new FS.Store.GridFS("images", {})]
)
```
3) Make sure the correct allow rules & subscriptions are set up on the collectionFS
```
Images.allow
  insert: (userId, doc) ->
    true
  download: (userId)->
    true
```
and
```
Meteor.publish 'images', ->
  Images.find()
```
and in your router.coffee
```
  @route "profile",
    waitOn: ->
      [
        Meteor.subscribe 'images'
      ]
```
4) Define your schema and set the `autoform` property like in the example below
```
Schemas = {}

@Posts = new Meteor.Collection('posts');

Schemas.Posts = new SimpleSchema
	title:
		type:String
		max: 60
		
	picture:
		type: String
		autoform:
			afFieldInput:
				type: 'fileUpload'
				collection: 'Images'
        label: 'Choose file' # optional

Posts.attachSchema(Schemas.Posts)
```

The `collection` property is the field name of your collectionFS.

5) Generate the form with `{{> quickform}}` or `{{#autoform}}`

e.g.
```
{{> quickForm collection="Posts" type="insert"}}
```

or

```
{{#autoForm collection="Posts" type="insert"}}
{{> afQuickField name="title"}}
{{> afQuickField name="picture"}}
<button type="submit" class="btn btn-primary">Insert</button>
{{/autoForm}}
```
###Security & optimization###
The above example is just a starting point. You should set your own custom `allow` rules and optimize your subscriptions.

### Customization ###
You can customize the button / remove text.

Defaults:
```
{{> afFieldInput name="picture" label="Choose file" remove-label="Remove"}}
```
