class Item < ApplicationRecord
  with_options presence:true do
    validates :image
    validates :name
    validates :profile
    validates :detail
    validates :category_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipment_days_id
    validates :fee, inclusion:{in: 300..9999999, message:'指定金額の範囲で入力して下さい'},
     numericality:{only_integer: true, message:'半角数字を使用して下さい'}
  end

  with_options numericality:{other_than: 0} do
    validates :category_id   
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipment_days_id
  end

  # Associations
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipment_days
end


