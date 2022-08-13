class Song < ApplicationRecord
    belongs_to :user
    belongs_to :power_hour

    def user
        User.find(self.user_id).name
    end
end
