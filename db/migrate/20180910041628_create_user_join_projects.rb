class CreateUserJoinProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_join_projects do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
