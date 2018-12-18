class ItemsController < ApplicationController
  def index
  end

  def new
    render :new, layout: "sub-layout"
  end
  def show
  end
end
