class User < ApplicationRecord
  has_secure_password

	has_many :profiles
	validates :email, presence: true
	validates :name, presence: true
end
