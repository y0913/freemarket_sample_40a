class TransactionsController < ApplicationController
  def index
    render :index, layout: "sub-layout"
  end

  def bought
    render :bought, layout: "sub-layout"
  end
end
