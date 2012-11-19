class VotesController < ApplicationController

	def create
		post = Post.find(params[:post_id])
		if current_user.id != post.user_id
			Vote.create(user_id: current_user.id, post_id: post.id)
		end
		redirect_to root_path
	end

end