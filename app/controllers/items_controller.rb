class ItemsController < ApplicationController
  def index
    @items = Item.new
  end

  def new
    render :new, layout: "sub-layout"
  end
  def show
  end
end
