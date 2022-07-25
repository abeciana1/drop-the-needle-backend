class User < ApplicationRecord
    validates :email, uniqueness: true
    has_many :participants
    has_many :hosts
    has_many :power_hours, through: :participants
    has_many :songs
    has_secure_password
end
