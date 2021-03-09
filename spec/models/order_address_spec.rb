require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before '商品購入' do 
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address =FactoryBot.build(:order_address, item_id:item.id, user_id:user.id)
    sleep(0.01)
  end

  #商品購入できる時
  it 'すべての値が正しく入力されていれば購入できる' do
    expect(@order_address).to be_valid
  end

  it 'house_nameが空でも購入できる' do
    expect(@order_address).to be_valid
  end

  #商品購入できない時
  it 'postal_codeが空だと購入できないこと' do
    @order_address.postal_code = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
  end
  
  it 'postal_codeにハイフン(-)がないと購入できないこと' do
    @order_address.postal_code = '1234567'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code is invalid. Input correctly")
  end
  
  it 'postal_codeは前半3桁の半角数字、後半4桁の半角数字でないと購入できないこと' do
    @order_address.postal_code = '1234-567'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code is invalid. Input correctly")
  end
  
  it 'prefecture_idが0だと購入できないこと' do
    @order_address.prefecture_id = 0
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
  end
  
  it 'cityが空だと購入できないこと' do
    @order_address.city = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("City can't be blank")
  end
  
  it 'house_numberが空だと購入できないこと' do
    @order_address.house_number = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("House number can't be blank")
  end
  
  it 'telephoneが空だと購入できないこと' do
    @order_address.telephone = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
  end
  
  it 'telephoneが半角数字でないと購入できないこと' do
    @order_address.telephone = '０９０１２３４５６７８'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Telephone is invalid. 11桁以内の半角数字で入力してください")
  end
  
  it 'telephoneにハイフン(-)があると購入できないこと' do
    @order_address.telephone = '090-1234-5678'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Telephone is invalid. 11桁以内の半角数字で入力してください")
  end
  
  it 'telephoneが11桁以内でないと購入できないこと' do
    @order_address.telephone = '090123456789'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Telephone is invalid. 11桁以内の半角数字で入力してください")
  end
  
  it 'tokenが空だと購入できないこと' do
    @order_address.token = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Token can't be blank")
  end
  
  it 'item_idが空だと購入できないこと' do
    @order_address.item_id = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Item can't be blank")
  end
  
  it 'user_idが空だと購入できないこと' do
    @order_address.user_id = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("User can't be blank")
  end
end
