class BrandsController < ApplicationController
  def search
    # インクリの際にnoneが出ないよう修正しました
    @brands = Brand.where("name LIKE ?", "#{params[:name]}%").where.not(id: 1)
    respond_to do |format|
        format.html { redirect_to :root }
        format.json { render json: {brands:@brands}}
      end
  end
end
