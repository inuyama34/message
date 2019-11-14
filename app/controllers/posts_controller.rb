class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy,:edit,:show,:update]
  
  def index
        @posts = current_user.posts.order(id: :desc).page(params[:page])
  end

  def show
   
  end

  def new
    @post = current_user.posts.build
  end

  def create
   @post = current_user.posts.build(post_params)
    if @post.save
     flash[:success] ="Postが正常に投稿されました"
     redirect_to @post
   else
      flash.now[:danger] ="Postが投稿されませんでした"
      render :new
    end
  end

  def edit
 
  
  end

  def update
    @post =Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = 'post は正常に更新されました'
      redirect_to @post
    else
      flash.now[:danger] = 'post は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @post= Post.find(params[:id])
    @post.destroy

    flash[:success] = 'post は正常に削除されました'
    redirect_to posts_url
  end

 private

  # Strong Parameter
  def post_params
    params.require(:post).permit(:content,:title,:img, :remove_img)
  end
end

def correct_user
    @post= current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
end

