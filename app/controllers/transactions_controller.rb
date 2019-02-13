class TransactionsController < ApplicationController
  before_action :before_login
  before_action :set_item
  before_action :buy_redirect, only:[:buy]
  before_action :done_redirect, only:[:done]

  def buy
    @user = current_user
    @address = @user.address
    render :buy, layout: "sub-layout"
  end

  def pay
    @user = current_user
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
      :amount => @item.price,
      :customer => "#{@user.customer_id}",
      :currency => 'jpy',
    )
    @item.item_state_id = 3
    @item.save
    @trade = Trade.new(user_id: @item.user_id, item_id: @item.id, transaction_state_id: 1, buyer_id: current_user.id)
    @trade.save
    redirect_to controller: 'transactions', action: 'done'
  end

  def done
    @user = current_user
    @address = @user.address
    render :done, layout: "sub-layout"
  end

  def order_status
    @user = @item.user
    @trade = @item.trade
  end

  def bought
    @user = @item.user
    @trade = @item.trade
  end

  def condition
    @trade = Trade.find_by(item_id: @item.id)
    @trade.transaction_state_id = 2
    @trade.save
    redirect_to controller: 'transactions', action: 'order_status'
  end

  private
  def before_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def buy_redirect
    redirect_to item_path(@item.id) if @item.item_state_id == 3
  end

  def done_redirect
    @trade = @item.trade
    redirect_to item_path(@item.id) unless @trade.transaction_state_id == 1 && current_user.id = @trade.buyer_id
  end
end
