class FollowingController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow]

  def follow
    current_user.follow(@user)
    redirect_to user_path(@user), notice: t('alerts.followings.start', user: @user.name)
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to user_path(@user), notice: t('alerts.followings.stop', user: @user.name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
