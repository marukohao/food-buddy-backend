class Restaurant < ApplicationRecord
  has_many :hosts
  has_many :users, through: :hosts
end
