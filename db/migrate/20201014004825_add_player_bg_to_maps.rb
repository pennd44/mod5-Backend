class AddPlayerBgToMaps < ActiveRecord::Migration[6.0]
  def change
    add_column :maps, :player_bg, :string
  end
end
