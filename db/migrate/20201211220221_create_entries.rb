class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :change_log_id
      t.integer :committer_id
      t.string :message

      t.timestamps
    end
  end
end
