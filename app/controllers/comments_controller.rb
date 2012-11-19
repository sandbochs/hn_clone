class CommentsController < ApplicationController

	load_and_authorize_resource
	skip_authorize_resource only: :index

	def index
		@post = Post.find(params[:post_id])
		@comments = @post.comments
		@comment = Comment.new
	end

	def show
	end

	def create
		#before_filter??
		post = Post.find(params[:post_id])
		
		@comment = Comment.new(params[:comment])
		@comment.user_id = current_user.id
		@comment.post_id = post.id

		if @comment.save
			redirect_to post_comments_path(post)
		end

	end

	def edit
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	end

	def update
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])

		if @comment.update_attributes(params[:comment])
			redirect_to post_comments_path(@post)
		end					
	end

end