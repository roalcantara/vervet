class Auth0Controller < ApplicationController
  skip_before_action :verify_profile, only: [:destroy, :callback, :failure]

  def callback
    @user = authenticate

    if @user.profile_complete?
      redirect_to root_path
    else
      redirect_to edit_user_path @user
    end
  end

  def failure
    @error_msg = request.params['message']
    redirect_to root_path, alert: @error_msg
  end

  def destroy
    logout
    redirect_to root_path
  end
end
