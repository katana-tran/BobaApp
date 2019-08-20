class Topping < ApplicationRecord
    has_many :cup_toppings
    has_many :cups, through: :cup_toppings
    validates :name, uniqueness: true, presence: true
    validates :img_url, presence: true
end
