class ItemCommentsController < ApplicationController
  def create
  	@item_comments = Item_comments.new(comment_params)
  	binding.pry
  	@item_comments = @comment.create(text: comment_params[:text], item_id: comment_params[:item_id], user_id: comment_params[:user_id])
  end

  def comment_params
  	binding.pry
  	params.require(:item_comments).permit(:text, :item_id, :user_id, :body)
  end
end
