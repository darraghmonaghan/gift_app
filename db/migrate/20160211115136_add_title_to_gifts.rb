class AddTitleToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :title, :string
  end
end
