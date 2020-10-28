class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.jsonb :backbone_document
      t.jsonb :scrum_document
    end
  end
end
