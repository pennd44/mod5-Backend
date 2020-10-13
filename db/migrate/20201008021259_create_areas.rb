class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      
      t.string :name
      t.string :quote
      t.string :background
      t.string :avatar

      t.references :map, null: false, foreign_key: true

      t.timestamps
    end
  end
end
