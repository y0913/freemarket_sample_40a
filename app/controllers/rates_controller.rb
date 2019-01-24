class RatesController < ApplicationController
  def create
    @item = Item.find(params[:id])
    @trade = Trade.find_by(item_id: @item.id)
    @price = @item.price * 0.9
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
        @profit = Profit.new(user_id: current_user.id, item_id: @item.id, profit: @price)
        @profit.save
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
