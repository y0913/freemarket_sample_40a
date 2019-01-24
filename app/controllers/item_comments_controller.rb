class ItemCommentsController < ApplicationController

  def create
  	@item_comment = ItemComment.new(comment_params)
  	if @item_comment.save
  	  redirect_to items_path
  	end
  end

  private
  def comment_params
  	params.require(:item_comment).permit(:comment).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
