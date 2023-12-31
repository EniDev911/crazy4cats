class User < ApplicationRecord
  has_many :comments
  has_many :reactions
  has_many :publications, through: :reactions
  enum :role, [:normal_user, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
