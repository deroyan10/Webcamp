class UsersController < ApplicationController
  def show
    @newbook = Book.new
    @books = Book.all
    @user = User.find(params[:id])
  end

  def edit
  end
end
