class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  has_many :hosts
  has_many :restaurants, through: :hosts
  has_many :joins
  has_many :notifications
end
