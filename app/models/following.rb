class Following < ApplicationRecord
  belongs_to :user
  belongs_to :follower, class_name: 'User'

  validates :user, presence: true
  validates :follower, presence: true

  after_create :notify

  private

  def notify
    UserMailer.new_follower(user, follower).deliver_now
  end
end
