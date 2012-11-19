class NewestController < ApplicationController

  def index
    @posts = Post.newest.page(params[:page]).per(20)
  end

end