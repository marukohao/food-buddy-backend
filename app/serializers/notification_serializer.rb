class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :host_id, :new, :user_id
end
