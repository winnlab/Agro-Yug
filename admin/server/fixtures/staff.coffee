insertStaff = ->
  return if do Staff.find().count > 0
  staff = [
    firstName: 'Петро'
    secondName: 'Порошенко'
    photo: 'petro.jpg'
  ,
    firstName: 'Валерий'
    secondName: 'Клейбаум'
  ,
    firstName: 'Юлия'
    secondName: 'Рыбалко'
  ,
    firstName: 'Джават'
    secondName: 'Наджафов'
  ]

  _.each staff, (person, i) ->
    person.position =  staff.length - i
    person.info = '<p>Должность: директор</p><p>Опыт работы: 6 лет.</p><p>Email: email@email.com</p>'

    if person.photo
      person.photo = StaffPhoto.insert("#{process.env.PWD}/public/img/#{person.photo}")._id

    Staff.insert person

do insertStaff
