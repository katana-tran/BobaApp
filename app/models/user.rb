class User < ApplicationRecord
    has_many :cups
    has_secure_password
    validates :username, :email, uniqueness: true, presence: true
end
