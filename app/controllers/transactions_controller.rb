class TransactionsController < ApplicationController
  def index
    render :index, layout: "sub-layout"
  end

  def pay
    Payjp.api_key = 'sk_test_274b737e3ca8b2ce2925f882'
    charge = Payjp::Charge.create(
      :amount =>  1000,
      :card => params['payjp-token'],
      :currency => 'jpy',
    )
    redirect_to root_path, notice: 'ありがとうございました。'
  end
end
