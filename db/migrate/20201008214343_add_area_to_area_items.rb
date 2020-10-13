class AddAreaToAreaItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :area_items, :area, null: false, foreign_key: true
  end
end
