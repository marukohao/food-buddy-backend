class Host < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :joins
  has_many :users, through: :joins
  validates :user_id, uniqueness: {scope: [:date, :restaurant_id]}
  validates :date, :time, :party, presence: { message: "input can't be blank" }
end
