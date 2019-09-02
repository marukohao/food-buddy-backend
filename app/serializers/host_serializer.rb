class HostSerializer < ActiveModel::Serializer
  attributes :id, :date, :time, :party, :user_id, :restaurant_id
end
