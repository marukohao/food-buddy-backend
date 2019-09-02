class Host < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :joins
  has_many :users, through: :joins
end
