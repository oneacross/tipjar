class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :identity_url
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
