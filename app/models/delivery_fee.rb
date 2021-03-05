class DeliveryFee < ActiveHash::Base
  self.data =[
    {id: 0, name: '__'},
    {id: 1, name: '一律700円（購入者負担）'},
    {id: 2, name: '送料込み（出品者負担）'}
  ]
  
  include ActiveHash::Associations
  has_many :items
end