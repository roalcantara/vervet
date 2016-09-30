require 'rails_helper'

RSpec.describe Auth0Controller do
  describe 'GET #callback' do
    let(:user) { create :user }
    before { expect(controller).to receive(:authenticate).and_return(user) }

    it 'redirects to the profile page' do
      get :callback
      expect(response).to redirect_to edit_user_path(User.last)
    end
  end

  describe 'GET #failure' do
    it 'redirects to the root_path' do
      get :failure
      expect(response).to redirect_to root_path
    end
  end

  describe 'GET #destroy' do
    before { expect(controller).to receive(:logout) }
    it 'destroy the auth session' do
      get :destroy
      expect(response).to redirect_to root_path
    end
  end
end
