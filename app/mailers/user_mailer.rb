class UserMailer < ApplicationMailer
  def new_follower(followed, follower)
    @followed = followed
    @follower = follower
    @url = "http://vervet.herokuapp.com/users/#{@followed.id}"
    mail to: @followed.email, subject: t('.subject')
  end
end
