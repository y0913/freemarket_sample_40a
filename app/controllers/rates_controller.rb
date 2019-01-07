class RatesController < ApplicationController
  def create
    @item = Item.find(params[:id])
    @trade = Trade.find_by(item_id: @item.id)
    if @trade.buyer_id == current_user.id
      @rate = Rate.new(rate_buy_params)
      @rate.save
      if @rate.save
        @trade.transaction_state_id = 3
        @trade.save
      end
      redirect_to controller: 'transactions', action: 'bought'
    elsif @item.user_id == current_user.id
      @rate = Rate.new(rate_exhibit_params)
      @rate.save
      if @rate.save
        @trade.transaction_state_id = 4
        @trade.save
      end
      redirect_to controller: 'transactions', action: 'order_status'
    end
  end

  private
  def rate_buy_params
    params.permit(:rate, :comment).merge(user_id: @item.user_id, trade_id: @trade.id)
  end

  def rate_exhibit_params
    params.permit(:rate, :comment).merge(user_id: @trade.buyer_id, trade_id: @trade.id)
  end
end
