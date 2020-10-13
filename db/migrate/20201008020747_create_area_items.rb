class CreateAreaItems < ActiveRecord::Migration[6.0]
  def change
    create_table :area_items do |t|
      t.integer :price
      t.references :item, null: false, foreign_key: true
      # t.references :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
