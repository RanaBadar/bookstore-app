class BooksController < ApplicationController

  def index
    @book = Book.all
  end

  def show 
  @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end
  def create
    book = Book.create(book_param)
    if book.save
    flash[:notice]= "you create a new book "
    redirect_to books_path

    else 
      flash[:notice]= "please select pdf or Doc file"
      redirect_to new_book_path
    end 
  end 

  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_param)
    flash[:notice]= "you update(#{@book.title})"
    end 
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice]= "you delete(#{@book.title})"
    redirect_to books_path
  end
  private
def book_param
  params.require(:book).permit( :title, :description, :name, :mail, :auther_id, :file )
end

end
