module V3
  class PostsController < ::ApplicationController
    def index
      @posts = MockPost.all
    end

    def show
      @post = MockPost.find(params[:id])
    end
  end
end
