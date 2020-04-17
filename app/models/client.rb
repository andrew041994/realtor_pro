class Client < ApplicationRecord
    has_many :user_clients
    has_many :users, through: :user_clients
    has_many :companies, through: :users

end
