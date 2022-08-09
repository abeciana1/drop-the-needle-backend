class User < ApplicationRecord
    validates :email, uniqueness: true
    has_many :hosts
    has_many :power_hours, through: :hosts
    has_many :participants
    has_many :power_hours, through: :participants
    has_many :songs
    has_secure_password

    def hosting
        self.hosts.map do |host|
            power_hour = PowerHour.find(host.power_hour_id)
        end
    end

    def participating
        self.participants.map do |participant|
            power_hour = PowerHour.find(participant.power_hour_id)
        end
    end
end
