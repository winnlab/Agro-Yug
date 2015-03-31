@Staff = TAPi18n.Collection 'staff',
  base_language: Meteor.settings.public.lng
  languages: Meteor.settings.public.langs

@StaffPhoto = new FS.Collection 'staffPhoto', Schemas.StaffPhoto

@StaffPhoto.allow
  download: -> true
