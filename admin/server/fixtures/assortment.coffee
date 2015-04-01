insertCategories = (data, img, cb) ->
  if data.categoryId
    data.categoryId = Categories.findOne( name: data.categoryId )._id
  if img
    CategoryImg.insert "#{process.env.PWD}/public/img/#{img}", (err, result) ->
      data.img = result._id
      Categories.insert data, cb
  else
    Categories.insert data, cb

insertAssortment = ->
  categories = [
    name: 'Пестициды'
    img: 'card1.png'
    type: 'text'
  ,
    name: 'Семена'
    img: 'card4.png'
    type: 'pdf'
  ,
    name: 'Комплексные системы защиты растений'
    img: 'card5.png'
    type: 'pdf'
    children: false
  ,
    name: 'Сельхозтехника'
    img: 'card2.png'
    type: 'pdf'
  ,
    name: 'Удобрения'
    img: 'card3.png'
    type: 'text'
  ,
    categoryId: 'Удобрения'
    name: 'Сила жизни'
    type: 'text'
    children: false
  ,
    categoryId: 'Удобрения'
    name: 'Омекс'
    type: 'text'
    children: false
  ,
    categoryId: 'Сельхозтехника'
    name: 'Насосы'
    type: 'pdf'
    children: false
  ,
    categoryId: 'Сельхозтехника'
    name: 'Опрыскиватели'
    type: 'pdf'
    children: false
  ]

  unless do Categories.find().count
    i = -1
    do processCategory = ->
      i += 1
      return if i > categories.length - 1
      category = categories[i]
      category.children = true if category.children isnt false
      category.position = categories.length - i
      category.overview = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum, nemo.'
      category.description = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore deleniti numquam iste dolores sit eum explicabo labore possimus fugiat ab!'
      insertCategories category, category.img, processCategory

do insertAssortment
