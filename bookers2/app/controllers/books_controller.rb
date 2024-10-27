class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to user_path(current_user.id)
  end

  def index
  end

  def edit
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_path
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
