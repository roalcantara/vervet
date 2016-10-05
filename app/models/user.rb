class User < ApplicationRecord
  VALID_USERNAME_REGEX = /\A(\w|\.)+\z/
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

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
end
