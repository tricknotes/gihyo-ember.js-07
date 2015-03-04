module V1
  class PostsController < ::ApplicationController
    def index
      @posts = MockPost.all
      @comments = @posts.flat_map {|post| post.comments }
    end

    def show
      @post = MockPost.find(params[:id])
    end
  end
end
