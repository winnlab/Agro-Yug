Meteor.methods
  sendCooperationEmail: (data) ->
    do @unblock

    check [
      data.email
      data.name
      data.offer
      data.phone
      data.company
      data.situation
    ], [Match.Optional String]

    Email.send
      to: Meteor.settings.admin.email
      from: data.email
      subject: "Предложение о струдничестве" + if data.company then " от #{} data.company" else ""
      html: """
        <p>Компания: #{data.company}</p>
        <p>Должность: #{data.situation}</p>
        <p>Имя и Фамилия: #{data.name}</p>
        <p>Номер телефона: #{data.phone}</p>
        <h3>Предложение:</h3>
        <p>#{data.offer}</p>
        """
