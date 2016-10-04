class Vervet.Search
  constructor: ->
    @$form = $('header nav .search-form')
    @$reset = @$form.find('i.reset')
    @bind()

  bind: ->
    @$reset.on 'click', @reset

  reset: (e) =>
    @$form.find('input').val('')

$(document).on 'ready page:load', ->
  window.Vervet.search = new Vervet.Search()
