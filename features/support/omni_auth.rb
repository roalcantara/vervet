OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:auth0] = {
  provider: 'auth0',
  uid: '123545',
  info: {
    name: 'mockuser',
    image: 'mock_user_thumbnail_url'
  },
  credentials: {
    token: 'mock_token',
    secret: 'mock_secret'
  }
}
