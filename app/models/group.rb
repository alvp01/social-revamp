class Group < ApplicationRecord
  validates :group_name, uniqueness: true
  validates :group_name, :group_description, presence: true

  belongs_to :creator, class_name: 'User'

  has_many :registrations, class_name: 'GroupRegistration', foreign_key: 'group_id'

  has_many :members, through: :registrations, source: :member

  has_many :discussions, foreign_key: 'group_id'
end
