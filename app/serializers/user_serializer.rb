class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :participants
  has_many :hosts
end
