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

end
