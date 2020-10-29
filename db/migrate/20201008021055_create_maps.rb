class CreateMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :maps do |t|
      t.string :battle_bg
      t.string :name
      t.string :image
      t.timestamps
    end
  end
end
