class CreateBadAirlinesOrders < ActiveRecord::Migration
  def change
    create_table :bad_airlines_orders do |t|
      t.belongs_to :bad_arline
      t.belongs_to :order
    end
  end
end
