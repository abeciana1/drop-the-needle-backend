class PowerHourSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :cover_image, :date_time, :add_to_list, :hosts, :participants, :publish_status, :submission_deadline

  has_many :songs

  def hosts
    object.hosts.map do |host|
      user = User.find(host.user_id)
      ::UserSerializer.new(user).attributes
    end
  end

  def participants
    object.participants.map do |participant|
      user = User.find(participant.user_id)
      ::UserSerializer.new(user).attributes
    end
  end
  
end
