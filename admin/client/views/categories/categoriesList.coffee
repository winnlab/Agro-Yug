Template.adminCategoriesList.helpers
  showCategories: ->
    if not @category or @category.children then true else false
  isCategoriesList: ->
    do @categories.count > (if typeof @currentId is 'undefined' then 0 else 1)
