class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :destroy]
  skip_before_action :verify_profile, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    respond_with @user
  end

  def destroy
    @user.destroy
    respond_with @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:provider, :uid, :name, :username, :email, :bio, :avatar)
  end

  def authorize
    redirect_to root_path, alert: t('errors.forbidden') unless @user.id == current_user.try(:id)
  end
end
