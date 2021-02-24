class User < ApplicationRecord
  validates :fullname, :email, :password, :username, presence: true
  validates :email, :username, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: 'AuthorId'
  has_many :comments, foreign_key: 'AuthorId'
end
