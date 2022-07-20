class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    #.booksは関連づけされていてuser has_many booksの関係なのでそのユーザーに関連しているbooksを全て呼び出せる。
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
   else
     render:edit
   end
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all

  end

  private
  def user_params
    params.require(:user).permit(:profile_image,:name,:introduction)
  end
end
