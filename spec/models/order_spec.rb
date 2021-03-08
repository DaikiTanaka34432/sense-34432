require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

    #商品購入ができる時
  it "priceとtokenがあれば保存ができること" do
    expect(@order).to be_valid
  end

    #商品購入ができない時
  it "feeが空では登録できないこと" do
    @order.fee = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Fee can't be blank")
  end
  
  it "tokenが空では登録できないこと" do
    @order.token = nil
    @order.valid? 
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end
end
