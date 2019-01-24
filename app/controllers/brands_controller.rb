class BrandsController < ApplicationController
  def search
    @brands = Brand.where("name LIKE ?", "#{params[:name]}%")
    respond_to do |format|
        format.html { redirect_to :root }
        format.json { render json: {brands:@brands}}
      end
  end
end
