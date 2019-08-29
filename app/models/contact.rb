class Contact < ApplicationRecord
  belongs_to :user
	validates :name, :email, :address, :phone, presence: true
	validates :email, uniqueness: true
end
