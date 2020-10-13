class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :damage, default: 0
      t.string :description
      t.string :category

      t.string :visual
      t.string :icon

      t.integer :current_health, default: 0
      t.integer :max_health, default: 0
      t.integer :attack, default: 0
      t.integer :defense, default: 0
      t.integer :current_mp, default: 0
      t.integer :max_mp, default: 0
      t.integer :speed, default: 0
      t.integer :charm, default: 0
      t.integer :intelligence, default: 0
      t.integer :current_energy, default: 0
      t.integer :max_energy, default: 0
      t.integer :money, default: 0
      # weapon proficiency
      t.integer :ranged, default: 0
      t.integer :sharp, default: 0
      t.integer :blunt, default: 0
      t.integer :heavy_armor, default: 0
      t.integer :light_armor, default: 0

      # job progress
      t.integer :convience_store, default: 0
      t.integer :crime, default: 0
      t.integer :resturaunt, default: 0
      t.integer :bounty_hunter, default: 0

      t.integer :required_current_health, default: 0
      t.integer :required_max_health, default: 0
      t.integer :required_attack, default: 0
      t.integer :required_defense, default: 0
      t.integer :required_current_mp, default: 0
      t.integer :required_max_mp, default: 0
      t.integer :required_speed, default: 0
      t.integer :required_charm, default: 0
      t.integer :required_intelligence, default: 0
      t.integer :required_current_energy, default: 0
      t.integer :required_max_energy, default: 0
      t.integer :required_money, default: 0
      # weapon proficiency
      t.integer :required_ranged, default: 0
      t.integer :required_sharp, default: 0
      t.integer :required_blunt, default: 0
      t.integer :required_heavy_armor, default: 0
      t.integer :required_light_armor, default: 0

      # job progress
      t.integer :required_convience_store, default: 0
      t.integer :required_crime, default: 0
      t.integer :required_resturaunt, default: 0
      t.integer :required_bounty_hunter, default: 0

      t.timestamps
    end
  end
end
