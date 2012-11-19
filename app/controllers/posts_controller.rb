class PostsController < ApplicationController

	def index
		@posts = Post.scoped.page(params[:page]).per(20)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post])
		@post.user_id = current_user.id

		if @post.save
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
		authorize! :edit, @post
	end

	def update
		@post = Post.find(params[:id])

	end

end