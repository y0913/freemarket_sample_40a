class TransactionsController < ApplicationController
  def buy
    @item = Item.find(params[:id])
    @user = current_user
    @address = @user.address
    render :buy, layout: "sub-layout"
  end

  def pay
    @user = User.find(params[:id])
    @item = Item.find(params[:id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
      :amount => @item.price,
      :customer => "#{@user.customer_id}",
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
