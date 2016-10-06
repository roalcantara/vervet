require 'rails_helper'

RSpec.describe FollowingController do
  let(:current_user) { create :user }
  let(:user) { create :user }
  before { expect(controller).to receive(:current_user).and_return current_user }

  describe 'GET #follow' do
    it 'redirects to the followed user' do
      get :follow, params: { id: user.id }
      expect(response).to redirect_to user_path(user)
    end
  end

  describe 'GET #unfollow' do
    context 'when the current_user follows the user' do
      before { current_user.follow(user) }

      it 'redirects to the unfollowed user' do
        get :unfollow, params: { id: user.id }
        expect(response).to redirect_to user_path(user)
      end
    end
  end
end
