class ParticipantSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :power_hour_id

  has_one :user
  has_one :power_hour
end
