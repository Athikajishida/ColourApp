class Colour < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    validates :name, presence: true, uniqueness: true, length: { in: 3..20 }
    
end