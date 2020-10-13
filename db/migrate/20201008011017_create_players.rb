class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :username
      t.string :password_digest
      t.string :avatar
      t.integer :current_health, default: 10
      t.integer :max_health, default: 10
      t.integer :attack, default: 8
      t.integer :defense, default: 4
      t.integer :current_mp, default: 4
      t.integer :max_mp, default: 4
      t.integer :speed, default: 4
      t.integer :charm, default: 4
      t.integer :intelligence, default: 4
      t.integer :current_energy, default: 10
      t.integer :max_energy, default: 10
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

      # references
      # t.references :map, null: false, foreign_key: true


      t.timestamps
    end
  end
end
