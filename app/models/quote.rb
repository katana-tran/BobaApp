class Quote < ApplicationRecord
    validates :quote, uniqueness: true
end
