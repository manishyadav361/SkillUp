class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :task, null: false, foreign_key: true
      t.string :link
      t.string :title
      
      t.timestamps
    end
  end
end
