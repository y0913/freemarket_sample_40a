class ItemsController < ApplicationController
  before_action :set_item,only:[:edit,:update,:show,:destroy,:stop]
  before_action :user_collation,only:[:edit,:update,:destroy]
  before_action :user_login,only:[:new, :show]

  WOMAN = 1
  MAN = 2
  OTHERS = 3

  def index
    @items = Item.where(brand_id: 5).order("created_at DESC").limit(4)
    @items_for_woman = Category.get_items_for(WOMAN)
    @items_for_man = Category.get_items_for(MAN)
    @items_for_others = Category.get_items_for(OTHERS)
  end

  def new
    @item = Item.new
    4.times {@item.images.build}
    render :new, layout: "sub-layout"
  end

  def show
  	@item = Item.find(params[:id])
    id = @item.user_id
    @goods = Rate.where(rate: 1, user_id: id)
    @normals = Rate.where(rate: 2, user_id: id)
    @bads = Rate.where(rate: 3, user_id: id)
  end

  def create
    brand = Brand.find_by(name:params[:item][:brand])
    @item =Item.new(exhibit_params)
    brand == nil ? @item.brand_id = 1 : @item.brand_id = brand.id
    @item.save
    if @item.save
      respond_to do |format|
        format.js
        format.html {redirect_to root_path}
      end
    end
  end

  def search
    @item = Item.new
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20)
  end

  def destroy
    if @item.user_id == current_user.id
      if @item.destroy
        redirect_to root_path notice:'編集できました'
      else
        redirect_to root_path notice: 'エラーが発生しました。'
      end
    end
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

  private
  def exhibit_params
    params[:item].permit(:name,:description,:condition_id,:postage_id,:delivery_method_id,:prefecture_id,:delivery_day_id,:price,:category_id,:size_id,images_attributes:[:id,:image]).merge(user_id:current_user.id)
  end


  def set_item
    @item = Item.find(params[:id])
  end

  def user_collation
    return redirect_to root_path  unless @item.user_id == current_user.id
  end

  def user_login
    return redirect_to new_user_session_path  unless user_signed_in?
  end
end



