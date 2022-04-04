class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.integer :user_id
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
