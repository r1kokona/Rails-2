class AddForeignKeysToUserSkills < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :user_skills, :users if foreign_key_exists?(:user_skills, :users)
    remove_foreign_key :user_skills, :skills if foreign_key_exists?(:user_skills, :skills)

    add_foreign_key :user_skills, :users, on_delete: :cascade
    add_foreign_key :user_skills, :skills, on_delete: :cascade
  end
end
