class CreatePlayerItems < ActiveRecord::Migration[6.0]
  def change
    create_table :player_items do |t|
      t.boolean :equipped
      t.references :player, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
