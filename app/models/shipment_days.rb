class ShipmentDays < ActiveHash::Base
  self.data =[
    {id: 0, name: '__'},
    {id: 1, name: '１〜３日で発送'},
    {id: 2, name: '４〜７日で発送'},
    {id: 3, name: '入荷でき次第発送'},
  ]

  include ActiveHash::Associations
  has_many :items
end