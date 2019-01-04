class RatesController < ApplicationController
  def create
    @item = Item.find(params[:id])
    @trade = Trade.find_by(item_id: @item.id)
    if @trade.buyer_id == current_user.id
      @rate = Rate.new(rate: params[:rate], user_id: @item.user_id, comment: params[:comment], trade_id: @trade.id, agreement: params[:agreement])
      @rate.save
      if @rate.save
        @trade.transaction_state_id = 3
        @trade.save
      end
      redirect_to controller: 'transactions', action: 'bought'
    elsif @item.user_id == current_user.id
      @rate = Rate.new(rate: params[:rate], user_id: @trade.buyer_id, comment: params[:comment], trade_id: @trade.id, agreement: params[:true])
      @rate.save
      if @rate.save
         @trade.transaction_state_id = 4
         @trade.save
      end
      redirect_to controller: 'transactions', action: 'order_status'
    end
  end
end
