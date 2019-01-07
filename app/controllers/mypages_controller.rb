class MypagesController < ApplicationController

before_action :before_login

def index
end


def new
  @items = Item.new
end

def card
  @items = Item.new
end

def listing
  @items = current_user.items.where(item_state_id: 1).order("created_at DESC")
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
