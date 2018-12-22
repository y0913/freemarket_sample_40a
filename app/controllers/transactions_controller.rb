class TransactionsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @user = @item.user
    @address = @user.address
    render :index, layout: "sub-layout" and return
  end

  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
      :amount => @item.price,
      :customer => 'cus_acd01324dde1603d181d040f7a8f',
      :currency => 'jpy',
    )
    @item.item_state_id = 3
    @item.save
    redirect_to controller: 'transactions', action: 'done'
  end

  def done
    @item = Item.find(params[:id])
    @user = @item.user
    @address = @user.address
    render :done, layout: "sub-layout"
  end
end
