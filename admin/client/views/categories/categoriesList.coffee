Template.adminCategoriesList.helpers
  isCategoriesList: ->
    do @categories.count > (if typeof @currentId is 'undefined' then 0 else 1)
