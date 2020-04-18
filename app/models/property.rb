class Property < ApplicationRecord
    validates :address, :price, presence: true
    belongs_to :company
end
