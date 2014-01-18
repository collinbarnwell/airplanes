class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.float :max_price
      t.datetime :departure_time_start
      t.datetime :departure_time_end

      t.datetime :return_time_start
      t.integer :return_time_end

      t.timestamps
    end
  end
end
