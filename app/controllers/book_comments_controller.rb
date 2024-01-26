class BookCommentsController < ApplicationController

  def create #ここのローカルでもインスタンスでもいい
    book = Book.find(params[:book_id])
    #book_comment = BookComment.new(book_comment_params)
    #book_comment = current_user.book_comments.new(book_comment_params)
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
