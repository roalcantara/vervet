require 'rails_helper'

RSpec.describe UsersController do
  let(:valid_attributes) { attributes_for :user }
  let(:invalid_attributes) { attributes_for(:user, name: nil) }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all users as @users' do
      user = User.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'GET #show' do
    let(:user) { User.create! valid_attributes }
    it 'assigns the requested user as @user' do
      get :show, params: { id: user.to_param }, session: valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET #edit' do
    let(:user) { User.create! valid_attributes }
    it 'assigns the requested user as @user' do
      get :edit, params: { id: user.to_param }, session: valid_session
      expect(assigns(:user)).to eq(user)
    end

    context 'when the user edited is not the logged in' do
      it 'redirects to the home page' do
        get :edit, params: { id: user.to_param }, session: valid_session
        expect(response).to redirect_to root_path
      end
    end

    context 'when the user edited is the logged in' do
      before { expect(controller).to receive(:current_user).and_return user }
      it 'shows the edit page' do
        get :edit, params: { id: user.to_param }, session: valid_session
        expect(request.path).to eq edit_user_path(user)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for :user }

      context 'when the user updated is the logged in' do
        let(:user) { User.create! valid_attributes }
        before { expect(controller).to receive(:current_user).and_return user }

        it 'updates the requested user' do
          put :update, params: { id: user.to_param, user: new_attributes }, session: valid_session
          user.reload
          expect(user.name).to eq new_attributes[:name]
          expect(user.username).to eq new_attributes[:username]
        end

        it 'assigns the requested user as @user' do
          put :update, params: { id: user.to_param, user: valid_attributes }, session: valid_session
          expect(assigns(:user)).to eq(user)
        end

        it 'redirects to the user' do
          put :update, params: { id: user.to_param, user: valid_attributes }, session: valid_session
          expect(response).to redirect_to(user)
        end
      end

      context 'when the user is not the logged in' do
        let(:user) { User.create! valid_attributes }
        let(:other) { create :user }
        before { expect(controller).to receive(:current_user).and_return other }
        it 'redirects to the home page' do
          put :update, params: { id: user.to_param, user: valid_attributes }, session: valid_session
          expect(response).to redirect_to root_path
        end
      end
    end

    context 'with invalid params' do
      let(:user) { User.create! valid_attributes }
      before { expect(controller).to receive(:current_user).and_return user }

      it 'assigns the user as @user' do
        put :update, params: { id: user.to_param, user: invalid_attributes }, session: valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        put :update, params: { id: user.to_param, user: invalid_attributes }, session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      user = User.create! valid_attributes
      expect(controller).to receive(:current_user).and_return user
      expect do
        delete :destroy, params: { id: user.to_param }, session: valid_session
      end.to change(User, :count).by(-1)
    end

    it 'redirects to the users list' do
      user = User.create! valid_attributes
      expect(controller).to receive(:current_user).and_return user
      delete :destroy, params: { id: user.to_param }, session: valid_session
      expect(response).to redirect_to(users_url)
    end
  end
end
