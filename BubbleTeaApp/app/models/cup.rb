class Cup < ApplicationRecord
    has_many :cup_toppings
    has_many :toppings, through: :cup_toppings
    belongs_to :tea
    belongs_to :user
    belongs_to :straw



    




end
