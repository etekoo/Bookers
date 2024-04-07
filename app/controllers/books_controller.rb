class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
      flash[:success] = "successfully created"
      redirect_to book_path(@book.id)
    else
      render :index
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
      flash[:success] = "successfully updated"
      redirect_to book_path(@book.id)
    else
      flash[:error] = "Update failed"
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:success] = "successfully deleted"
      redirect_to '/books'
    else
      flash[:error] = "Deletion failed"
      render :index
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end