class CreatePlayerSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :player_skills do |t|
      t.references :player, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
