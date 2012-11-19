class Comment < ActiveRecord::Base
	attr_accessible :user_id, :post_id, :text

	belongs_to :user
	belongs_to :post

	def editable?
		(Time.now - self.created_at) < (15 * 60)
	end
	
end