class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.boolean :approved
      t.string :reward
      t.string :time
      t.string :category
      
      t.timestamps
    end
  end
end
