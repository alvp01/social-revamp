class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :registrations, class_name: 'GroupRegistration', foreign_key: 'group_id'

  has_many :members, through: :registrations, source: :member

  has_many :discussions, foreign_key: 'group_id'
end
