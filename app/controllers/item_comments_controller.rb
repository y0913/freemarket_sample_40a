class ItemCommentsController < ApplicationController
  def create
  	@comment = @item.comment.create(comment_params)
  end

  def comment_params
  	params.require(:comment).permit(:text, :item_id)
  end
end
