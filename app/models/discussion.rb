class Discussion < ApplicationRecord
  validates :text, presence: true

  belongs_to :author, foreign_key: 'AuthorId', class_name: 'User'
  belongs_to :group, foreign_key: 'group_id'
  has_many :comments, as: :commentable, dependent: :destroy
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
