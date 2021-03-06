class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  enum kind: [:accident, :fire, :robbery]

  validates :kind, presence: true, inclusion: { in: kinds.keys }
  validates :description, presence: true, length: { in: 5..144 }
  validates :location, presence: true, length: { in: 5..100 }
  validates :author, presence: true

  delegate :name, to: :author, prefix: true
  delegate :nickname, to: :author, prefix: true

  scope :recent, -> { limit(100).order(created_at: :desc) }
  scope :posted_by, ->(authors) { where(author_id: authors).order(created_at: :desc).limit(100) }
end
