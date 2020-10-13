class Item < ApplicationRecord
    has_many :player_items
    has_many :players, through: :player_items
    has_many :enemy_items
    has_many :enemies, through: :enemy_items
    has_many :area_items
    has_many :areas, through: :area_items
end
