Template.categoryColumns.helpers
  columns: ->
    columns = []
    _(3).times (i) -> columns.push i
    return columns
  inColumn: (i, j) ->
    (i + (3 - j)) % 3 is 0
  categories: ->
    Categories.find {}, sort: position: -1
