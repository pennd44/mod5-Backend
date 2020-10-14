class AddMapImageToArea < ActiveRecord::Migration[6.0]
  def change
    add_column :areas, :map_image, :string
  end
end
