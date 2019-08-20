class CupTopping < ApplicationRecord
    belongs_to :cup
    belongs_to :topping
end
