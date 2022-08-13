class PowerHour < ApplicationRecord
    has_many :participants
    has_many :users, through: :participants
    has_many :hosts
    has_many :users, through: :hosts
    has_many :songs
end
