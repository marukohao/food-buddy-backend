class MessageSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :host_id, :message, :user_avatar
end
