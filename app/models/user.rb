class User < ApplicationRecord
  validates :fullname, :email, :password, :username, presence: true
  validates :email, :username, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: 'AuthorId'
  has_many :comments, foreign_key: 'AuthorId'

  has_many :followed_users, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :following_users, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  has_many :followees, through: :followed_users, source: :followed
  has_many :followers, through: :following_users, source: :follower
end
