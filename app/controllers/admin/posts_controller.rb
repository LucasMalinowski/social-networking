class Admin::PostsController < AdminController
  before_action :set_posts, only: [:edit, :update, :destroy]

  def index
    @posts = Post.order(created_at: :asc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @posts.destroy
    redirect_to admin_posts_path 
  end

  def edit
  end
  
  def update
    params = form_params.to_h

    if @posts.update(params)
      redirect_to admin_posts_path
    else
      render :edit
    end

  end

  private

  def set_posts
    @posts = Post.find(params[:id])
  end
end