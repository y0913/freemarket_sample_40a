class ItemsController < ApplicationController

  def index
    @item = Item.all
    @items = Item.new
  end
  def new
    @item = Item.new
    2.times {@item.images.build}
    render :new, layout: "sub-layout"
  end

  def show
  	@items = Item.new
  	@item = Item.find(params[:id]) #指定したデータ取得できているかテストする
    @user = User.find(params[:id])
  end

  def create
    @item =Item.new(exhibit_params)
    @item.save
  end

  private
  def exhibit_params
    params[:item].permit(:name,:description,:condition_id,:postage_id,:delivery_method_id,:prefecture_id,:delivery_day_id,:price,:category_id,images_attributes:[:id,:image]).merge(user_id:current_user.id)
  end
  end



