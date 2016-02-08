class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :description
      t.string :URL
      t.integer :price
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
