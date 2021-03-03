class UserCheck < ActiveHash::Base
  self.data = [
    {id:0, name: '___'},
    {id:1, name: '芸人（出品者）として利用'},
    {id:2, name: '一般ユーザーとして利用'}
  ]

  include ActiveHash::Associations
  has_many :users
end
