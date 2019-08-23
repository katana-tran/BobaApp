class Tea < ApplicationRecord
    has_many :cups

    def self.most_used_tea
        most_used_tea = ""
        how_many_times = 0
        Tea.all.each do |tea|
            if tea.cups.length > how_many_times
                how_many_times = tea.cups.length
                most_used_tea = tea.name
            end
        end
        "#{most_used_tea} has been used #{how_many_times} times."
    end
end
