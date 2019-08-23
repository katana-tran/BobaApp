class Topping < ApplicationRecord
    has_many :cup_toppings
    has_many :cups, through: :cup_toppings
    validates :name, {presence: true, uniqueness: true}
    validates :img_url, {presence: true, uniqueness: true}
    validate :is_it_proper_pic
    # validates_format_of :img_url, :with => %r{\.(png|jpg|jpeg)$}i, :message => "whatever"

    def is_it_proper_pic
        if self.img_url.include?("jpg") || self.img_url.include?("png") || self.img_url.include?("jpeg")
            return true
        end
    end

    def self.most_used_topping
        most_used = ""
        amount_times_used = 0
        Topping.all.each do |topping|
            if topping.cup_toppings.length > amount_times_used
                amount_times_used = topping.cup_toppings.length
                most_used = topping.name
            end
        end
        return "The most used topping is #{most_used} which has been used #{amount_times_used}."
    end

    
end
