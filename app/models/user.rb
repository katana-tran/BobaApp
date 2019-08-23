class User < ApplicationRecord
    has_many :cups
    has_secure_password
    validates :username, :email, uniqueness: true, presence: true

    def self.most_cups_made
        most_cups = ""
        length = 0
        User.all.each do |user|
            if user.cups.length > length
                most_cups = user.username
                length = user.cups.length
            end
        end
        return "User #{most_cups} has created #{length} cups."
    end

    def self.most_recent_user
        "The most recent user is #{User.last.username}."
    end

end
