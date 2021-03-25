class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
    @post.photos.build
    # binding.pry
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to root_path
    else
      flash[:notice] = "投稿に失敗しました"
      render :new
    end
  end

  def index
    @posts = Post.limit(10).includes(:photos, :user).order('created_at DESC')
  end

  private
    def post_params
      params.require(:post).permit(:caption, photos_attributes: [:image]).merge(user_id: current_user.id)
    end
end
