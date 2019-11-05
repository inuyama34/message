class PostsController < ApplicationController
  def index
    @posts=Post.all.order(id:desc).page(params[:page]).per(5)
  end

  def show
     @post=Post.find(params[:id])
  end

  def new
    @post=Post.new
  end

  def create
   @post= Post.new(post_params)
    if @post.save
     flash[:success] ="Postが正常に投稿されました"
     redirect_to @post
   else
      flash.now[:danger] ="Postが投稿されませんでした"
      render :new
    end
  end

  def edit
    @post=Post.find(params[:id])
  
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
    params.require(:post).permit(:content,:title)
  end
end
