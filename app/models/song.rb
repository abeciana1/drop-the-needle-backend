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

    def convert_link_embed
        # turn this --- https://www.youtube.com/watch?v=qgtkPKZ2OPk
        # into this --- https://www.youtube.com/embed/fvXPmtkojnw
        youtube_id = self.youtube_link.split('=')
        converted_link = "https://www.youtube.com/embed/#{youtube_id[1]}"
        return converted_link
    end

    def embed_link
        converted_start_time = time_to_second_convert(self.start_time)
        converted_end_time = time_to_second_convert(self.end_time)
        embed_link = "#{self.convert_link_embed}?start=#{converted_start_time}&end=#{converted_end_time}"
        return embed_link
    end
end
