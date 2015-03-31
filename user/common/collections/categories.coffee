@Categories = TAPi18n.Collection 'categories',
  base_language: Meteor.settings.public.lng
  languages: Meteor.settings.public.langs

@CategoryImg = new FS.Collection 'categoryImg', Schemas.CategoryImg

@CategoryImg.allow
  download: -> true
