class PowerHourSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :cover_image, :date_time

  has_many :participants
  has_many :hosts
  has_many :songs
end
