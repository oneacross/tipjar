class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :band_name
      t.string :place
      t.integer :money

      t.timestamps
    end
  end
end
