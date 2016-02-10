class AddTimeToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :time, :time
  end
end
