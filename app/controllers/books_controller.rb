class BooksController < ApplicationController
  def top
  end

  def index
    @books=Book.all
    @book=Book.new
  end

  def show
    @book=Book.find(params[:id])
  end



  def create
    @book=Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id),notice:'Book was successfully created.'
    else
      flash.now[:alert]='message error'
      @books=Book.all
      render :index
    end
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id),notice:'Book was successfully updated.'
    else
      flash.now[:alert]='update error'
      render :edit
    end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to index_book_path,notice:'Book was successfully destroyed'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end


