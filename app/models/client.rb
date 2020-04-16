class Client < ApplicationRecord
    has_many :users
    has_many :companies, through: :users
end
