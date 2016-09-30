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
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for :user }
      let(:user) { User.create! valid_attributes }

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

    context 'with invalid params' do
      let(:user) { User.create! valid_attributes }

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
      expect do
        delete :destroy, params: { id: user.to_param }, session: valid_session
      end.to change(User, :count).by(-1)
    end

    it 'redirects to the users list' do
      user = User.create! valid_attributes
      delete :destroy, params: { id: user.to_param }, session: valid_session
      expect(response).to redirect_to(users_url)
    end
  end
end
