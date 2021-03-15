class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は英・数字の両方を含めて設定して下さい'} 
  with_options presence:true do
    validates :user_check_id, numericality:{other_than: 0, message: "can't be blank"} 
    validates :nickname
    validates :birthday
    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用して下さい'} do
      validates :last_name
      validates :first_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/, message: '全角カナ文字を使用して下さい'} do
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :telephone, format:{with: /\A\d{11}\z/, message: "is invalid. 11桁以内の半角数字で入力してください"}
  end

  # いいねをしたかを判定
  def liked_by?(item)
    # current_userに結びついているいいねの中で、いいねをしようとしているアイテムのitem_idが存在するか
    self.likes.exists?(item_id: item.id)
  end

  # Associations
  has_many :items
  has_many :likes, dependent: :destroy
  has_many :like_items, through: :likes, source: :user
  has_many :orders

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_check
  belongs_to :office
end
