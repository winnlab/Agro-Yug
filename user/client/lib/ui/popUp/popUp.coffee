$body = []
@UIpopUp =
  ###*
  * Function to show fixed pop-up on page
  * @opts {object} Object with pop-up options.
  ###
  show: (opts) ->
    unless opts
      throw new Meteor.Error 'pop-up', 'to show pop-up you must specify opts object'
    unless opts.tmpl
      throw new Meteor.Error 'pop-up', 'to show pop-up you must specify template'
    $body = $ 'body' unless $body.length
    @wrap = $ '<div class="pop-up-wrap"></div>'
    Blaze.renderWithData opts.tmpl, opts.data or {}, @wrap[0]
    @wrap.find('.close').on 'click', _.bind @close, @
    $body.addClass('no-overflow').append @wrap
  ###*
  * Function to close fixed pop-up on page
  ###
  close: ->
    @wrap.find('.close').off 'click'
    $body.removeClass 'no-overflow'
    Blaze.remove Blaze.getView @wrap.children()[0]
    do @wrap.remove
