class MypagesController < ApplicationController

before_action :before_login

def index
  @user = current_user
end


def new
  @items = Item.new
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

private
def before_login
  redirect_to new_user_session_path unless user_signed_in?
end

end
