class Vervet.Auth0
  CLIENT_ID = 'wYWBHB2NKAfZrZBqlk6AOfPBzpxEs3YP'
  DOMAIN = 'roalcantara.auth0.com'
  REDIRECT_TO = 'http://vervet.herokuapp.com/auth/callback'

  constructor: ->
    @$auth = $('header .auth0, .posts .auth0')
    @initialize()
    @bind()

  initialize: ->
    @lock = new Auth0Lock(CLIENT_ID, DOMAIN, auth:
      redirectUrl: REDIRECT_TO
      responseType: 'code'
      params: scope: 'openid email')

  bind: ->
    @$auth.on 'click', @show

  show: (e) =>
    @lock.show()

$(document).on 'ready page:load', ->
  window.Vervet.auth0 = new Vervet.Auth0()
