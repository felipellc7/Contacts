class User < ApplicationRecord
  has_secure_password
  mount_uploader :photo, ImageUploader
  has_many :contacts
  validates :name, :email, :address, :phone, presence: true
  validates :email, :access_token, uniqueness: true
end
