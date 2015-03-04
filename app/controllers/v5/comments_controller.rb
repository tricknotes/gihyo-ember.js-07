module V5
  class CommentsController < ::ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      @post = Post.find(comment_params[:post])
      @comment = @post.comments.build(comment_params.except(:post))

      @comment.save!

      render :show
    end

    def destroy
      Comment.destroy params[:id]

      render json: {}
    end

    private

    def comment_params
      params.require('comment').permit(
        :text,
        :post
      )
    end
  end
end
