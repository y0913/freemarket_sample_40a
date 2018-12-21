class ItemsController < ApplicationController

  def index
    @item = Item.all
    @items = Item.new
  end
  def new
    @item = Item.new
    4.times {@item.images.build}
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

  def create
    # ヘッダーがform_for @itemsのため仮置き
    # 別担当者がヘッダー訂正次第削除予定です
    @items = Item.new
    @item =Item.new(exhibit_params)
    @item.save
  end

  private
  def exhibit_params
    params[:item].permit(:name,:description,:category_id,:condition_id,:item_state_id,:delivery_method_id,:prefecture_id,:price,images_attributes:[:id,:image])
  end
end


