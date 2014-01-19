class RemoveMaxPriceFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :max_price, :float
  end
end
