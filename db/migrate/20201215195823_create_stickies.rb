class CreateStickies < ActiveRecord::Migration[6.0]
  def change
    create_table :stickies do |t|
      t.integer :position
      t.string :category
      t.timestamps
    end
  end
end
