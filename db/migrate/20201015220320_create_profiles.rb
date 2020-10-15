class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.jsonb :user_information
      t.timestamps
    end
  end
end
