class AddMapToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_reference :players, :map, null: false, foreign_key: true
  end
end
