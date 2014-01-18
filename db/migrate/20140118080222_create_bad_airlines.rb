class CreateBadAirlines < ActiveRecord::Migration
  def change
    create_table :bad_airlines do |t|
      t.string :title

      t.timestamps
    end
  end
end
