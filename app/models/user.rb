class User < ApplicationRecord
  has_secure_password
  mount_uploader :photo, ImageUploader
  validates :email, :access_token, uniqueness: true
end
