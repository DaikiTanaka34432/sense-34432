class DeliveryFee < ActiveHash::Base
  self.data =[
    {id: 0, name: '__'},
    {id: 1, name: '一律 ¥700円(税込)'},
    {id: 2, name: '送料込み'}
  ]
  
  include ActiveHash::Associations
  has_many :items
end