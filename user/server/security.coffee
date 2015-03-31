Meteor.startup ->
  rules = ['insert', 'update', 'remove']

  do Security.permit(rules).collections([
    Categories
    Products
    Staff
    CategoryImg
    ProductImg
    ProductPdf
    StaffPhoto
  ]).never().apply
