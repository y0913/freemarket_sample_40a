class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = @user.items.order("created_at DESC").limit(3).where.not(item_state_id: 2)
    @goods = Rate.where(rate: 1, user_id: @user.id)
    @normals = Rate.where(rate: 2, user_id: @user.id)
    @bads = Rate.where(rate: 3, user_id: @user.id)
  end
end
