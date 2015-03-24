Router.configure
  layoutTemplate: 'layout'
  i18n:
    defaultLanguage: Meteor.settings.public.lng
    langCodeForDefaultLanguage: false
    languages: Meteor.settings.public.langs
    autoConfLanguage: true

Router.before ->
  language = do Router.getLanguage
  TAPi18n.setLanguage language if TAPi18n.getLanguage() isnt language
  do @next
