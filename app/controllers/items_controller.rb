class ItemsController < ApplicationController
  def index
    @item = Item.all
    @items = Item.new
  end
  def new
    render :new, layout: "sub-layout"
  end
  def create
  	Item.create(image: items_params[:image], text: items_params[:text], user_id: current_user.id)
  end
  def show
  	@items = Item.new
  	@item = Item.find(params[:id]) #指定したデータ取得できているかテストする
    @user = User.find(params[:id])
  end

  private
  def items_params
  	params.require(:items).permit(:user_id, :text, :image, :id)
  end
end
