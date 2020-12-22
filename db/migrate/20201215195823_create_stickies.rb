class CreateStickies < ActiveRecord::Migration[6.0]
  def change
    create_table :stickies do |t|
      t.integer :project_id
      t.integer :position
      t.integer :category_id, default: nil
      t.integer :user_story_id
      t.timestamps
    end
  end
end