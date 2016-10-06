class PostsController < ApplicationController
  before_action :set_post, only: [:destroy]

  respond_to :html

  def index
    @posts = Post.includes(:author).recent
    @following_posts = Post.includes(:author).posted_by(current_user.following.map(&:id)) if user_signed_in?
    respond_with(@posts)
  end

  def new
    @post = Post.new(new_post_params)
    render partial: 'form', layout: nil
  end

  def create
    @post = Post.new(post_params.merge(author_id: current_user.id))
    if @post.save
      render partial: 'post', locals: { post: @post }, layout: nil
    else
      render partial: 'form', layout: nil, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    head :ok
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:kind, :description, :location, :author_id)
  end

  def new_post_params
    params.permit(:kind)
  end
end
