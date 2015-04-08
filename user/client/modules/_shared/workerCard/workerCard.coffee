Template.workerCard.helpers
  getPhoto: (_id) ->
    do StaffPhoto.findOne(_id).url
