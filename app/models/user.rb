class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence:true do
    validates :user_check_id
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
    
  validates :user_check_id, numericality:{other_than: 0, message: "can't be blank"} 

 
  # Associations
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user_check
  belongs_to :office
end
