class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @items = Item.new.get_items_for(params[:id])
  end
end
