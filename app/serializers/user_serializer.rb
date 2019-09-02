class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :location, :bio
end
