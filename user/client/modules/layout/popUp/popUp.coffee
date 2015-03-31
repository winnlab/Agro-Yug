Template.popUpCoopOffer.events
  'click .close': ->
    $('body').removeClass 'no-overflow'
    Blaze.remove Blaze.getView document.getElementById 'pop-up-offer'
  'submit #cooperation-offer': (ev) ->
    do ev.preventDefault
    formData = _.reduce do $(ev.target).serializeArray, (obj, el) ->
      obj[el.name] = el.value;
      return obj
    , obj

    Meteor.call 'sendCooperationEmail', formData, (err, status) ->
      console.error err if err
      console.log status if status
