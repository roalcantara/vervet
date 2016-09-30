require 'rails_helper'

RSpec.describe Auth0Helper do
  it 'is a Auth0Concern' do
    expect(Auth0Helper.ancestors).to include Auth0Concern
  end

  describe '#destroy_session_path' do
    it 'returns the path to logout' do
      expect(helper.destroy_session_path)
        .to eq Auth0Helper::LOGOUT_PATH
    end
  end
end
