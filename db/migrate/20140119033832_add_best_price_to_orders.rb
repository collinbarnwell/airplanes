class AddBestPriceToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :best_price, :float
    add_column :orders, :active, :boolean, default: true
  end
end
