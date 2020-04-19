class User < ApplicationRecord
   has_many :user_clients
  belongs_to :company
  has_many :clients, through: :user_clients
  has_many :properties, through: :company
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
