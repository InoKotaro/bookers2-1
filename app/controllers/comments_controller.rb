class CommentsController < ApplicationController

  def create
     @book= Book.find(params[:book_id])#あとでidを渡すためにコメする本を識別
     @comment= Comment.new(comment_params)#コメするためにコメモデル初期化
     @comment.user_id = current_user.id#ログイン中ユーザーidをコメモデルのuser_idに置換え
     @comment.book_id = book.id#4行目で取得した本idをコメモデルのbook_idに置換え
     #これでコメモデルに必要なカラム置換え完了
     @comment.save
     redirect_to book_path(book)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end

 private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
