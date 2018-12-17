class TransactionsController < ApplicationController
  def index
    render :index, layout: "sub-layout"
  end
end
