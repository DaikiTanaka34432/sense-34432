class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,             null: false
      t.text       :profile,          null: false
      t.text       :detail,           null: false
      t.integer    :category_id,      null: false
      t.integer    :delivery_fee_id,  null: false
      t.integer    :prefecture_id,    null: false
      t.integer    :shipment_days_id, null: false
      t.integer    :fee,              null: false
      t.references :user,             null: false, foreign_key: true
      t.integer     :likes_count
      t.timestamps
    end
  end
end
