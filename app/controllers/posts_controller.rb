class PostsController < ApplicationController
  def index
    @posts = Post.all
    @comments = Comment.where(post_id: @posts)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    @post.save!
  end

  def update
    @post = Post.find(params[:id])

    @post.update! post_params
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :body
    )
  end
end
