class Song < ApplicationRecord
    belongs_to :user
    belongs_to :power_hour

    def user
        User.find(self.user_id).name
    end

    def time_to_second_convert(time)
        split_time = time.split(':').map(&:to_i)
        if split_time.length === 3
            (split_time[0]) * 60 * 60 + (split_time[1]) * 60 + (split_time[2])
        else
            (split_time[0]) * 60 + (split_time[1])
        end
    end

    def embed_link
        converted_start_time = time_to_second_convert(self.start_time)
        converted_end_time = time_to_second_convert(self.end_time)
        # binding.pry
        embed_link = "#{self.youtube_link}?start=#{converted_start_time}&end=#{converted_end_time}"
        return embed_link
    end
end
