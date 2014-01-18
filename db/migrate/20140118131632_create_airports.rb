class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :abbreviation
      t.string :city
      t.string :state
      t.string :name

      t.timestamps
    end

    add_column :orders, :start_airport_id, :integer
    add_column :orders, :end_airport_id, :integer
  end
end
