class Like < ApplicationRecord
  validates_uniqueness_of :item_id, scope: :user_id

  with_options presence:true do
    validates :user_id
    validates :item_id
  end

  belongs_to :user
  belongs_to :item, counter_cache: :likes_count
end
