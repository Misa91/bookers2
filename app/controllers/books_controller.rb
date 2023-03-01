class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path #いったん違う画面へリダイレクトさせるが本当はbookの詳細画面にいきたい？
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user #投稿に紐づいたユーザーの画像を表示させたいが、記述が間違っているかも
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
