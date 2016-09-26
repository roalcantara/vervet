Jumpup::Heroku.configure do |config|
  config.app = 'vervet'
end if Rails.env.development?
