class CreateEnemyItems < ActiveRecord::Migration[6.0]
  def change
    create_table :enemy_items do |t|
      t.boolean :equipped
      t.references :enemy, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
