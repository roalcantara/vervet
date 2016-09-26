require 'rails_helper'

RSpec.describe ApplicationController do
  it 'is an ActionController::Base' do
    expect(ApplicationController.ancestors).to include ActionController::Base
  end
end
