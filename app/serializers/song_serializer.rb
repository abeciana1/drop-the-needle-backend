class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :album, :youtube_link, :start_time, :end_time, :power_hour_id, :order_number, :user_id

  has_one :user
  has_many :power_hour
end
