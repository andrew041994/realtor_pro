class Company < ApplicationRecord
    has_many :users
    has_many :clients, through: :users
    has_many :properties
end
