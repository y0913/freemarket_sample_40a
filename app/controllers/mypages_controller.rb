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
  @item = Item.find(params[:id])
  @user = @item.user
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

end
