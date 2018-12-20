class ItemsController < ApplicationController
  def index
  	@item = Item.all
    @items = Item.new

  end

  def new
    render :new, layout: "sub-layout"
  end
  def show
  end
end
