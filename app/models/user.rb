class User < ApplicationRecord
  validates :fullname, :email, :password, :username, presence: true
  validates :email, :username, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :discussions, foreign_key: 'AuthorId', dependent: :destroy
  has_many :posts, foreign_key: 'AuthorId', dependent: :destroy
  has_many :comments, foreign_key: 'AuthorId'

  has_many :followed_users, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :following_users, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  has_many :followees, through: :followed_users, source: :followed
  has_many :followers, through: :following_users, source: :follower

  has_many :created_groups, class_name: 'Group', foreign_key: 'creator_id'

  has_many :group_registrations, class_name: 'GroupRegistration', foreign_key: 'member_id'

  has_many :groups, through: :group_registrations, source: :group
end
