class BrandsController < ApplicationController
  before_action :brand_redirect, only:[:show]

  def search
    # インクリの際にnoneが出ないよう修正しました
    @brands = Brand.where("name LIKE ?", "#{params[:name]}%").where.not(id: 1)
    respond_to do |format|
        format.html { redirect_to :root }
        format.json { render json: {brands:@brands}}
      end
  end

  def show
    @items = @brand.items.order("created_at DESC")
  end

  private
  def brand_redirect
    @brand = Brand.find(params[:id])
    redirect_to root_path if @brand.id == 1
  end
end
