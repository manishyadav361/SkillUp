class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions do |t|
      t.references :task, null: false, foreign_key: true
      t.integer :taskId
      t.string :title
      t.string :description
      t.integer :userId
      t.string :status
      t.boolean :accepted
      t.timestamps
    end
  end
end
