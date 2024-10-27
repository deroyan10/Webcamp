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
  end
end
