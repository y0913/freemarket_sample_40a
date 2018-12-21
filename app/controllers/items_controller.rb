class ItemsController < ApplicationController

  def index
    @items = Item.new
  end

  def new
    # ヘッダーがform_for @itemsのため仮置き
    # 別担当者がヘッダー訂正次第削除予定です
    @items = Item.new
    @item = Item.new
    4.times {@item.images.build}
    render :new, layout: "sub-layout"
  end
  def show
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


