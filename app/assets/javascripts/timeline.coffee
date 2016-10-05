class Vervet.Timeline
  constructor: ->
    @$timeline = $('.timeline')
    @bind()

  bind: ->
    @$timeline.on 'ajax:success', '.remove', @remove_success
    @$timeline.on 'ajax:error', '.remove', @remove_error

  remove_success: (e, data, status, xhr) ->
    $(e.target).parent().fadeOut 'slow', ->
      $(e.target).parent().remove()

  remove_error: (e, data, status, xhr) ->
    Materialize.toast(xhr.responseText, 2000, 'red accent-3')

$(document).on 'ready page:load', ->
  window.Vervet.timeline = new Vervet.Timeline()
