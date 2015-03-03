module V1
  class PostsController < ::ApplicationController
    def index
      @posts = Post.all
      @comments = Comment.where(post_id: @posts)
    end

    def show
      @post = Post.find(params[:id])
    end
  end
end
