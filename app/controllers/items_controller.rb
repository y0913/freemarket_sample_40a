class ItemsController < ApplicationController
  before_action :set_item,only:[:edit,:update,:show,:destroy, :stop]
  before_action :user_collation,only:[:edit,:update,:destroy]
  before_action :user_login,only:[:new]

  def index
    @item = Item.order("created_at DESC").limit(4).where.not(item_state_id: 2)
    @items = Item.new

    woman
    man
    other

  end

  def new
    @item = Item.new
    4.times {@item.images.build}
    render :new, layout: "sub-layout"
  end

  def show
  	@item = Item.find(params[:id])
    @user = @item.user
    @goods = Rate.where(rate: 1, user_id: @user.id)
    @normals = Rate.where(rate: 2, user_id: @user.id)
    @bads = Rate.where(rate: 3, user_id: @user.id)
  end

  def create
    @item =Item.new(exhibit_params)
    @item.save
  end

  def search
    @item = Item.new
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20)
  end

  def category
    @category = Category.find(params[:id])
    @items = []
    @categories = []
    @categories << @category
    if @category.children.present?
      @category.children.each do |category1|
        @categories << category1
        if category1.children.present?
          category1.children.each do |category2|
            @categories << category2
          end
        end
      end
    end
    @categories.each do |category|
      if category.items.present?
        @items << category.items
      end
    end
    @items = @items.flatten
  end

  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      if item.destroy
        redirect_to root_path notice:'削除できました'
      else
        redirect_to root_path notice: 'エラーが発生しました。'
      end
    end
  end

  def stop
    @item.item_state_id = 2
    @item.save
    redirect_to root_path
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

  def woman
    @items_woman = []
    @woman = Category.find(1)
    @women = []
    @women << @woman
    @woman.children.each do |woman1|
      @women << woman1
      woman1.children.each do |woman2|
        @women << woman2
      end
    end
    @women.each do |woman|
      if woman.items.present?
        @items_woman << woman.items
      end
    end
    @items_woman = @items_woman.flatten
  end

  def man
    @items_man = []
    @man = Category.find(2)
    @men = []
    @men << @man
    @man.children.each do |man1|
      @men << man1
      man1.children.each do |man2|
        @men << man2
      end
    end
    @men.each do |man|
      if man.items.present?
        @items_man << man.items
      end
    end
    @items_man = @items_man.flatten
  end

  def other
    @items_other = []
    @other = Category.find(3)
    @others = []
    @others << @other
    @other.children.each do |other1|
      @others << other1
      other1.children.each do |other2|
        @others << other2
      end
    end
    @others.each do |other|
      if other.items.present?
        @items_other << other.items
      end
    end
    @items_other = @items_other.flatten
  end

  private
  def exhibit_params
    params[:item].permit(:name,:description,:condition_id,:postage_id,:delivery_method_id,:prefecture_id,:delivery_day_id,:price,:category_id,images_attributes:[:id,:image]).merge(user_id:current_user.id)
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



