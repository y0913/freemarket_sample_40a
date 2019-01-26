class MypagesController < ApplicationController
  before_action :before_login

  def index
  end

  def new
    @user = current_user
  end

  def create
    @user = current_user
    @user.update(profile_params)
    if @user.address.present?
      @address = @user.address.update(address_params)
    else
      @address = Address.new(address_params)
      @address.save
    end
    redirect_to mypages_path
  end

  def card
  end

  def listing
    @items = current_user.items.where.not(item_state_id: 3).order("created_at DESC")
  end

  def in_progress
    @trades = Trade.where(user_id: current_user.id).where.not(transaction_state_id: 4)
  end

  def completed
    @trades = Trade.where(user_id: current_user.id, transaction_state_id: 4)
  end

  def purchase
    @trades = Trade.where(buyer_id: current_user.id).where.not(transaction_state_id: 4)
  end

  def purchased
    @trades = Trade.where(buyer_id: current_user.id, transaction_state_id: 4)
  end

  def deliver_address
    @user = current_user
  end

  def edit
    @items = Item.new
  end

  def show
    @items = Item.new
  end

  def logout
    @items = Item.new
  end

  def review
    @rates = current_user.rates.order("created_at DESC").limit(10)
  end

  def good
    @rates = current_user.rates.order("created_at DESC").where(rate: 1).limit(10)
  end

  def normal
    @rates = current_user.rates.order("created_at DESC").where(rate: 2).limit(10)
  end

  def bad
    @rates = current_user.rates.order("created_at DESC").where(rate: 3).limit(10)
  end

  private
  def before_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def profile_params
    params.permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :birth_year, :birth_month, :birth_day)
  end

  def address_params
    params.permit(:post_number, :prefecture_id, :city, :address, :building, :building_tel).merge(user_id: @user.id)
  end
end
