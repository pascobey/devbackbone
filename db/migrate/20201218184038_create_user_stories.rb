class CreateUserStories < ActiveRecord::Migration[6.0]
  def change
    create_table :user_stories do |t|
      t.integer :project_id
      t.string :story, default: 'As a <type of user>, I want <some goal> so that <some reason>.'
      t.integer :value, default: 0
      t.integer :editor_user_id
      t.boolean :approved, default: false
      t.integer :color, default: 1
      t.timestamps
    end
  end
end
