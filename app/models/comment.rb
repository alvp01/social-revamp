class Comment < ApplicationRecord
  validates :text, presence: true

  belongs_to :author, foreign_key: 'AuthorId', class_name: 'User'
  belongs_to :commentable, polymorphic: true
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
