class User < ActiveRecord::Base
	has_secure_password

	attr_accessible :username, :password, :password_confirmation, :password_digest
	validates :username, uniqueness: true

	has_many :posts
	
end