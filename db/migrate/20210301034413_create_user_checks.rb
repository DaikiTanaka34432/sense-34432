class CreateUserChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_checks do |t|

      t.timestamps
    end
  end
end
