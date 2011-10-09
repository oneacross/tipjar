class CreateAggregateRequests < ActiveRecord::Migration
  def change
    create_table :aggregate_requests do |t|
      t.string :band_name
      t.string :place
      t.integer :money
      t.integer :count

      t.timestamps
    end
  end
end
