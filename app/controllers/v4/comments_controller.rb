module V4
  class CommentsController < ::ApplicationController
    def index
      @post = MockPost.find(params[:post_id])
      @comments = @post.comments
    end
  end
end
