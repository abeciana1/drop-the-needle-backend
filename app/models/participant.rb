class Participant < ApplicationRecord
    belongs_to :user
    belongs_to :power_hour
end
