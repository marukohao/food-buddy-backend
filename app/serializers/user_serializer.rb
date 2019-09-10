class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :location, :bio, :new, :new_host_id
end
