class MypagesController < ApplicationController

before_action :before_login

def index
  @user = current_user
end


def new
  @items = Item.new
  @user = current_user
end

def create
  @user = current_user
  @user.update(first_name: params[:first_name], last_name: params[:last_name], first_name_kana: params[:first_name_kana], last_name_kana: params[:last_name_kana], birth_year: params[:birth_year], birth_month: params[:birth_month], birth_day: params[:birth_day])
  if @user.address.present?
    @address = @user.address.update(user_id: @user.id, post_number: params[:post_number], prefecture_id: params[:prefecture_id], city: params[:city], address: params[:address], building: params[:building], building_tel: params[:building_tel])
  else
    @address = Address.new(user_id: @user.id, post_number: params[:post_number], prefecture_id: params[:prefecture_id], city: params[:city], address: params[:address], building: params[:building], building_tel: params[:building_tel])
    @address.save
  end
  redirect_to mypages_path
end

def card
  @items = Item.new
end

def listing
  @user = current_user
  @items = @user.items.where(item_state_id: 1).order("created_at DESC")
end

def in_progress
  @user = current_user
  @trades = Trade.where(user_id: @user.id, transaction_state_id: 1).or(Trade.where(user_id: @user.id, transaction_state_id: 2)).or(Trade.where(user_id: @user.id, transaction_state_id: 3))
end

def completed
  @user = current_user
  @trades = Trade.where(user_id: @user.id, transaction_state_id: 4)
end

def purchase
  @user = current_user
  @trades = Trade.where(buyer_id: @user.id, transaction_state_id: 1).or(Trade.where(buyer_id: @user.id, transaction_state_id: 2)).or(Trade.where(buyer_id: @user.id, transaction_state_id: 3))
end

def purchased
  @user = current_user
  @trades = Trade.where(buyer_id: @user.id, transaction_state_id: 4)
end

def deliver_address
  @user = current_user
end

def edit
  @items = Item.new
end

def show
  @items = Item.new
  @user = current_user
end

def logout
  @items = Item.new
end

def review
  @rates = current_user.rates.order("created_at DESC")
end

def good
  @rates = current_user.rates.order("created_at DESC").where(rate: 1)
end

def normal
  @rates = current_user.rates.order("created_at DESC").where(rate: 2)
end

def bad
  @rates = current_user.rates.order("created_at DESC").where(rate: 3)
end

private
def before_login
  redirect_to new_user_session_path unless user_signed_in?
end

end
