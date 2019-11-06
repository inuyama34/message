class UsersController < ApplicationController
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user=User.find(params[:id])
  end

  def new
    @user=User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      flash[:success] = "ユーザの登録に成功しました"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザーの登録に失敗しました"
      render :new
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
