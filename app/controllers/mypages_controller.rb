class MypagesController < ApplicationController


def index
  @items = Item.new
end


def new
  @items = Item.new
end

def card
  @items = Item.new
end

def listing
  @user = current_user
  @trades = Trade.where(transaction_state_id: 1)
  @listing = @trades.where(user_id: current_user.id)
  @item = Item.find(7)
end

def purchase
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

end
