class Comment < ActiveRecord::Base
	attr_accessible :user_id, :post, :text

	belongs_to :user
	belongs_to :post
	
end