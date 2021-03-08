class Order < ApplicationRecord
  validates :fee, presence: true
end
