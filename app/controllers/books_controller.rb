class BooksController < ApplicationController
  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
    else
     render:edit
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
    @user = current_user
    @books = Book.all
    render:index
    #renderでは遷移先のアクションを実行しないので遷移前でアクションを定義してあげる必要がある
    end
  end

  def show
    @user = current_user
    @book = Book.new
    @book_show = Book.find(params[:id])
  end

  def destroy
    @book_show = Book.find(params[:id])
    @book_show.delete
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:book_title,:opinion)
  end
end
