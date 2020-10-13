class CreateAreaSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :area_skills do |t|
      t.references :area, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true
      t.integer :current_health, default: 0
      t.integer :current_energy, default: 0
      t.integer :money, default: 0
      t.timestamps
    end
  end
end
