require 'rails_helper'

RSpec.describe ApplicationController do
  it 'is an ActionController::Base' do
    expect(ApplicationController.ancestors).to include ActionController::Base
  end

  it_behaves_like 'auth0_concern'
  it_behaves_like 'profile_validator_concern'
end
