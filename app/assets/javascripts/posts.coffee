class Vervet.Post
  constructor: ->
    @$container = $('.posts')
    @$modal = @$container.find('.modal.new')
    @$timeline = $('.timeline')
    @bind()

  bind: ->
    @$container.on 'ajax:success', '.add', @new
    @$modal.on 'click', '.save', @save_click
    @$modal.on 'ajax:success', 'form', @save_success
    @$modal.on 'ajax:error', 'form', @save_error
    @$modal.on 'click', '.kind .change', @change_kind

  change_kind: (e) =>
    $kind = $(e.target).data('kind')
    $icon = $(e.target).data('icon')
    @$modal.find('form .kind input').val($kind)
    @$modal.find('form .description .prefix').html($icon)

  new: (e, data, status, xhr) =>
    @$modal.find('.modal-content').html(xhr.responseText)
    @$modal.find('.tooltipped').tooltip({delay: 50})
    @$modal.openModal()

  save_click: (e) =>
    @$modal.find('form').submit()

  save_success: (e, data, status, xhr) =>
    @$timeline.prepend(xhr.responseText)
      .find('li').first().hide().fadeIn 'slow'
    @$modal.closeModal()

  save_error: (e, xhr, status, error) =>
    @$modal.find('.modal-content')
      .hide().html(xhr.responseText)
      .fadeIn('fast')

$(document).on 'ready page:load', ->
  window.Vervet.post = new Vervet.Post()
