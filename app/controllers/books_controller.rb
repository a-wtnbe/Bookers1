class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
       flash[:notice] = "successfully"
       redirect_to book_path(@book)
      #ここから
    else
       @books = Book.all
       render 'index'
      #ここまで
    end
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
       flash[:notice] = "successfully"
       redirect_to book_path
    else
       render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  # こっから下はコントローラーの中でしか呼ばないぞ
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
