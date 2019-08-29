class User < ApplicationRecord
  has_secure_password
  has_many :contacts
  validates :name, :email, :address, :phone, presence: true
  validates :email, :access_token, uniqueness: true
end
