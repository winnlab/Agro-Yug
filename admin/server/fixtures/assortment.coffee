insertAssortment = ->
  return if do Categories.find().count > 0
  path = Npm.require 'path'
  folder = path.normalize "#{__meteor_bootstrap__.serverDir}/../web.browser/app/img"
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

  _.each categories, (category, i) ->
    category.position =  categories.length - i
    category.children = true if category.children isnt false
    category.overview = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum, nemo.'
    category.description = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore deleniti numquam iste dolores sit eum explicabo labore possimus fugiat ab!'

    if category.categoryId
      category.categoryId = Categories.findOne( name: category.categoryId )._id
    if category.img
      category.img = CategoryImg.insert("#{folder}/#{category.img}")._id

    Categories.insert category

do insertAssortment
