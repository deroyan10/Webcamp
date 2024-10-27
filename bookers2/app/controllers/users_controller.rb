class UsersController < ApplicationController
  def index
    @newbook = Book.new
    @user = User.find(current_user.id)
    @users = User.all
  end

  def show
    @newbook = Book.new
    @books = Book.all
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
