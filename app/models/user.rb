class User < ApplicationRecord
  VALID_USERNAME_REGEX = /\A(\w|\.)+\z/
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_many :posts, -> { order(created_at: :desc) }, foreign_key: 'author_id', class_name: 'Post'

  has_many :followings
  has_many :followers, through: :followings

  has_many :active_relationships, class_name: 'Following',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :user

  validates :provider, presence: true
  validates :uid, presence: true
  validates :name, presence: true
  validates :username, uniqueness: { allow_nil: true, case_sensitive: false }
  validates :username, presence: true,
                       length: 3..20,
                       format: { with: VALID_USERNAME_REGEX },
                       on: :update
  validates :email, uniqueness: { allow_nil: true, case_sensitive: false }
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    on: :update

  def profile_complete?
    provider.present? && uid.present? && name.present? && username.present? && email.present?
  end

  def self.search(criteria)
    if criteria
      where 'lower(name) LIKE lower(:criteria) or lower(username) LIKE lower(:criteria)', criteria: "%#{criteria}%"
    else
      all
    end
  end

  def nickname
    "@#{username}"
  end

  def follow(user)
    user.followings.create(follower: self)
  end

  def unfollow(user)
    user.followers.destroy(self)
  end

  def follows?(user)
    user.followers.include?(self)
  end
end
