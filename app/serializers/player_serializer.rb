class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :current_health, :max_health, :attack, :defense, :current_mp, :max_mp, :speed, :charm, :intelligence, :current_energy, :max_energy, :money, :ranged, :sharp, :blunt, :heavy_armor, :light_armor, :convience_store, :crime, :resturaunt, :bounty_hunter, :map_id
end
