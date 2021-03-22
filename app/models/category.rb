class Category < ActiveHash::Base
  self.data =[
    {id: 0, name: '__'},
    {id: 1, name: 'ファッション'},
    {id: 2, name: 'スマホ'},
    {id: 3, name: '雑貨'},
    {id: 4, name: '日用品'},
    {id: 5, name: '本・音楽・DVD'},
    {id: 6, name: 'おもちゃ・ホビー'},
    {id: 7, name: 'イラスト・絵画'},
    {id: 8, name: 'レジャー'},
    {id: 9, name: 'ハンドメイド'},
    {id: 10, name: 'その他'}
  ]
  
  include ActiveHash::Associations
  has_many :items
end