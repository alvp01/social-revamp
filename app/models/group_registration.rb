class GroupRegistration < ApplicationRecord
  belongs_to :member, class_name: 'User'
  belongs_to :group, class_name: 'Group'
end
