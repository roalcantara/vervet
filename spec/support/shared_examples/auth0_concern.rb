require 'rails_helper'

RSpec.shared_examples 'auth0_concern' do
  describe '#authenticate' do
    context 'when is a new user' do
      let(:auth0) { create :auth0 }
      before { request.env[Auth0Concern::OMNIAUTH_KEY] = auth0 }

      it 'creates and returns the authenticated user' do
        expect(subject.authenticate).to eq User.last
      end
    end

    context 'when is an existing user' do
      let(:auth0) { create :auth0 }
      before do
        @existing_user = create :user, provider: auth0[:provider], uid: auth0[:uid]
        request.env[Auth0Concern::OMNIAUTH_KEY] = auth0
      end

      it 'finds and returns the existing authenticated user' do
        expect(subject.authenticate).to eq @existing_user
      end
    end
  end

  describe '#user_signed_in?' do
    context 'when user is signed_in' do
      let(:current_user) { create :user }
      before { session[Auth0Concern::CURRENT_USER_KEY] = current_user.id }

      it 'returns true' do
        expect(subject.user_signed_in?).to be_truthy
      end
    end

    context 'when user is NOT signed_in' do
      before { session[Auth0Concern::CURRENT_USER_KEY] = nil }

      it 'returns false' do
        expect(subject.user_signed_in?).to be_falsey
      end
    end
  end

  describe '#current_user' do
    context 'when user is signed_in' do
      let(:current_user) { create :user }
      before { session[Auth0Concern::CURRENT_USER_KEY] = current_user.id }

      it 'returns the user logged in' do
        expect(subject.current_user).to eq current_user
      end
    end

    context 'when user is NOT signed_in' do
      before { session[Auth0Concern::CURRENT_USER_KEY] = nil }

      it 'does not return anything' do
        expect(subject.current_user).to be_nil
      end
    end
  end

  describe '#logout' do
    before { expect(subject).to receive(:reset_session) }

    it 'resets the currrent session' do
      subject.logout
    end
  end

  describe '#current_user?' do
    let(:current_user) { create(:user) }
    before { session[Auth0Concern::CURRENT_USER_KEY] = current_user.id }

    context 'when the given user is the user signed in' do
      it 'returns true' do
        expect(subject.current_user?(current_user)).to be_truthy
      end
    end

    context 'when the given user is the user signed in' do
      let(:user) { create :user }
      it 'returns false' do
        expect(subject.current_user?(user)).to be_falsey
      end
    end
  end
end
