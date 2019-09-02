class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :location, :image_url
end
