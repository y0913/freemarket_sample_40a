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
  @items = @user.items
end

def in_progress
end

def completed
end

def purchase
end

def purchased
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
