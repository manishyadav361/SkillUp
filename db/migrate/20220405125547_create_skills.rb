class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :experience

      t.timestamps
    end
  end
end
