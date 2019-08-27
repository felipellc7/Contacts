class User < ApplicationRecord
	has_secure_password
	validates :email, :access_token, uniqueness: true
end
