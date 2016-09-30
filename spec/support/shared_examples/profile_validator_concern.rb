require 'rails_helper'

RSpec.shared_examples 'profile_validator_concern' do
  describe '#verify_profile' do
    context 'when the user have not compleated their profile' do
      controller do
        def index
          head :ok
        end
      end

      let(:current_user) { create :user, username: nil }
      before do
        expect(subject).to receive(:user_signed_in?).and_return true
        expect(subject).to receive(:current_user).twice.and_return current_user
      end

      it 'redirects the user to update their account' do
        get :index
        expect(response).to redirect_to [:edit, current_user]
      end
    end

    context 'when the user have compleated their profile' do
      controller do
        def index
          head :ok
        end
      end

      let(:current_user) { create :user }
      before do
        expect(subject).to receive(:user_signed_in?).and_return true
        expect(subject).to receive(:current_user).and_return current_user
      end

      it 'does not redirect the user' do
        get :index
        expect(response).to_not redirect_to [:edit, current_user]
      end
    end
  end
end
