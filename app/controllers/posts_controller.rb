class PostsController < ApplicationController

	before_filter :authenticate_user!, except: [:index]
	load_and_authorize_resource
	skip_authorize_resource only: :index

	def index
		posts = Post.all.sort { |a, b| b.score <=> a.score }
		@posts = Kaminari.paginate_array(posts).page(params[:page]).per(20)
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
	end

	def update
		@post = Post.find(params[:id])
	end

end