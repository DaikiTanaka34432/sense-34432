class Order < ApplicationRecord
  attr_accessor :token #この記載によりtokenについてのバリデーションを記述することができる。
  validates :fee, presence: true
  validates :token, presence: true
end
