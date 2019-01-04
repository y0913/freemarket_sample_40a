class TransactionsController < ApplicationController

  before_action :before_login
  before_action :set_item, only:[:buy, :pay, :done, :order_status, :bought, :condition]
  before_action :buy_redirect, only:[:buy]

  def buy
    @item = Item.find(params[:id])
    @user = current_user
    @address = @user.address
    render :buy, layout: "sub-layout"
  end

  def pay
    @user = current_user
    @item = Item.find(params[:id])
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
    @item = Item.find(params[:id])
    @user = current_user
    @address = @user.address
    render :done, layout: "sub-layout"
  end

  def order_status
    @item = Item.find(params[:id])
    @user = @item.user
    @trade = @item.trade
  end

  def bought
    @item = Item.find(params[:id])
    @user = @item.user
    @trade = @item.trade
  end

  def condition
    @item = Item.find(params[:id])
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
end
