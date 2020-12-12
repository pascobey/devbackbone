class CreateChangeLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :change_logs do |t|
      t.integer :project_id
      t.timestamps
    end
  end
end
