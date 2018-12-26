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
  @transaction =
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
