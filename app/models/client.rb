class Client < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, format: Devise.email_regexp
    has_many :user_clients
    has_many :users, through: :user_clients
    has_many :companies, through: :users
    has_many :client_properties
    has_many :properties, through: :client_properties

end
