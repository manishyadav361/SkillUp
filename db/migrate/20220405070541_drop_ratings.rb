class DropRatings < ActiveRecord::Migration[7.0]
  def change
    drop_table :ratings do |t|
      t.integer :rating , null: false
      t.integer :lead , null: false
      t.timestamps null:false
    end 
  end
end
