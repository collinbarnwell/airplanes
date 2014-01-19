class RemoveEndDates < ActiveRecord::Migration
  def change
    remove_column :orders, :departure_time_end, :datetime
    remove_column :orders, :return_time_end, :datetime
  end
end
