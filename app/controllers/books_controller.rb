class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
      flash[:success] = "作成が成功しました！"
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
      flash[:success] = "更新が成功しました！"
      redirect_to book_path(@book.id)
    else
      flash[:error] = "更新に失敗しました。"
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:success] = "削除が成功しました！"
      redirect_to '/books'
    else
      flash[:error] = "削除に失敗しました。"
      render :index
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end