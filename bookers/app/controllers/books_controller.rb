class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    #本来@booksが必要ないのに使用してしまっているからあとで変更が必要
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "Book was unsuccessfully create."
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully update."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "Book was unsuccessfully update."
      render :edit
    end

  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
