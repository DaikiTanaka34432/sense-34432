require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品登録' do
    before do
      @item =FactoryBot.build(:item)
    end

    #ユーザーが出品登録できる時
    it 'name,profile,detail,category_id,delivery_id,prefecture_id,shipment_id,feeが存在すれば登録できる' do
      expect(@item).to be_valid
    end

    it 'feeの値が300~9999999円以内であれば出品できる'do
    @item.fee = '9999999'
    expect(@item).to be_valid
  end

  it 'feeの値が半角数字あれば出品できる'do
    @item.fee = '300'
    expect(@item).to be_valid
  end 

    #ユーザーが出品登録できない時
    it '画像ファイルが空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    
    it '商品名が空だと登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    
    it '商品説明が空だと登録できない' do
      @item.profile = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Profile can't be blank")
    end
    
    it '商品詳細が空だと登録できない' do
      @item.detail = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end
    
    it 'category_idが0だと登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    
    it 'delivery_fee_idが0だと登録できない' do
      @item.delivery_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 0")
    end
    
    it 'prefecture_idが0だと登録できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
    end
    
    it 'shipment_days_idが0だと登録できない' do
      @item.shipment_days_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment days must be other than 0")
    end
    
    it 'feeが空だと登録できない' do
      @item.fee = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee can't be blank")
    end
    
    it 'feeが全角数字だと登録できない' do
      @item.fee = "３９８０"
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee 半角数字を使用して下さい")
    end
    
    it 'feeが全角文字だと登録できない' do
      @item.fee = 'あいうえお'
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee 半角数字を使用して下さい")
    end
    
    it 'feeが300円より低いと登録できない' do
      @item.fee = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee 指定金額の範囲で入力して下さい")
    end
    
    it 'feeが9,999,999円より高いと登録できない' do
      @item.fee = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee 指定金額の範囲で入力して下さい")
    end
    
    it 'ユーザーが紐づいていないと登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

  end
end
