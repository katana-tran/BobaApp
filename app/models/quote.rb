class Quote < ApplicationRecord
    validates :quote, uniqueness: true

    def self.rand_quote
        self.all[rand(self.count)]
    end


end


