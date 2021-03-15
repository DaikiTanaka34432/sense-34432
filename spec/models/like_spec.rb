require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "いいね保存" do
    before do
      @like = FactoryBot.build(:like)
    end

    #いいねが保存できる時
    it "user_idとitem_idがあれば保存できる" do
      expect(@like).to be_valid
    end
    
    #いいねが保存できない時
    it "user_idが空だと保存できない " do
      @like.user_id = nil
      @like.valid?
      expect(@like.errors.full_messages).to include("User can't be blank")
    end
    
    it "item_idが空だと保存できない " do
      @like.item_id = nil
      @like.valid?
      expect(@like.errors.full_messages).to include("Item can't be blank",)
    end
  end
end
