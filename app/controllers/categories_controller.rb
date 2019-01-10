class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @items = Category.get_items_for(params[:id])
  end
end
