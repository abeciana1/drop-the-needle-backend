class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :hosting, :participating 

  has_many :songs
  has_many :power_hours

end
