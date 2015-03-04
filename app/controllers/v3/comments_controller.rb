module V3
  class CommentsController < ::ApplicationController
    def index
      @comments = MockComment.all
      @comments = @comments.select {|comment| params[:ids].include?(comment.id.to_s) } if params[:ids]
    end

    def show
      @comment = MockComment.find(params[:id])
    end
  end
end
