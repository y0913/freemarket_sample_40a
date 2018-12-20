require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe "#Index" do
    it "itemにItem.allが入ってるか" do
      @item = Item.all
      expect(@item).to eq Item.all
    end
  end


end
