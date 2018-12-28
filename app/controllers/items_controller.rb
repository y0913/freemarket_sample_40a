class ItemsController < ApplicationController
  before_action :set_item,only:[:edit,:update,:show,:destroy]
  # before_action :user_collation,only:[:edit,:update,:destroy]
  def index
    @item = Item.order("RAND()")
    @items = Item.new
  end

  def new
    @item = Item.new
    4.times {@item.images.build}
    render :new, layout: "sub-layout"
  end

  def edit
    render :new, layout: "sub-layout"
  end

  def update
    if @item.update(exhibit_params)
      redirect_to root_path notice:'編集できました'
    else
      redirect_to root_path notice: 'エラーが発生しました。'
    end
  end

  def show
    @user = @item.user
  end

  def buy
  end

  def create
    @item =Item.new(exhibit_params)
    @item.save
  end


  def destroy
    if @item.destroy
      redirect_to root_path notice:'削除できました'
    else
      redirect_to root_path notice: 'エラーが発生しました。'
    end

  end

  private
  def exhibit_params
    params[:item].permit(:name,:description,:condition_id,:postage_id,:delivery_method_id,:prefecture_id,:delivery_day_id,:price,:category_id,images_attributes:[:id,:image,]).merge(user_id:current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
    # user_collation
  end

  # def user_collation
  #   return redirect_to root_path  unless @item.user_id == current_user.id
  # end
end



