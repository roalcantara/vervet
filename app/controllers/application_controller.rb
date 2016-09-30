require 'application_responder'

class ApplicationController < ActionController::Base
  include Auth0Concern
  include ProfileValidatorConcern

  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception
  ensure_security_headers # See more: https://github.com/twitter/secureheaders
end
