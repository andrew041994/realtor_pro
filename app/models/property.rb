class Property < ApplicationRecord
    scope :cheap_properties, -> {where("price < 200000")}
    validates :address, :price, presence: true
    belongs_to :company
    has_many :client_properties
    has_many :clients, through: :client_properties
    
end
