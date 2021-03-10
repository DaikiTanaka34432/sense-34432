class Office < ActiveHash::Base
  self.data = [
    {id:0, name: '___'},
    {id:1, name: 'よしもとクリエイティブ・エージェンシー'},
    {id:2, name: 'ワタナベエンターテインメント'},
    {id:3, name: '太田プロダクション'},
    {id:4, name: 'プロダクション人力舎'},
    {id:5, name: 'マセキ芸能社'},
    {id:6, name: '松竹芸能'},
    {id:7, name: 'サンミュージック'},
    {id:8, name: 'K-PRO'},
    {id:9, name: '浅井企画'},
    {id:10, name: 'トゥインクル・コーポレーション'},
    {id:11, name: 'タイタン'},
    {id:12, name: 'ホリプロコム'},
    {id:13, name: 'グレープカンパニー'},
    {id:14, name: 'ケイダッシュステージ'},
    {id:15, name: 'SMA'},
    {id:16, name: 'ASH&Dコーポレーション'},
    {id:17, name: 'その他、フリー'},
  ]

  include ActiveHash::Associations
  has_many :users
end
