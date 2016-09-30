class Auth0Controller < ApplicationController
  def callback
    @user = authenticate
    redirect_to edit_user_path @user
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
