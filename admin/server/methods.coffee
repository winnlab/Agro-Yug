Meteor.methods
    addEmail: (email) ->
      check email, String
      Meteor.users.update _id: @userId,
        $push:{
          email:
            address: email
            verified: false
        }
