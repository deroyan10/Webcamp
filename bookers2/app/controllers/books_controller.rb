class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
  end

  def show
    @book = Book.new
  end
end
