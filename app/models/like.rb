class Like < ApplicationRecord
  validates_uniqueness_of :item_id, scope: :user_id

  belongs_to :user
  belongs_to :item
end
