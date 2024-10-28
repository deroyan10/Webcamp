class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @newbook = Book.new(book_params)
    @books = Book.all
    @user = User.find(current_user.id)
    @newbook.user_id = current_user.id
    if @newbook.save
      flash[:notice] = "You have created book successfully"
      redirect_to book_path(@newbook.id)
    else
      render :index
    end
  end

  def index
    @newbook = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
