class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :username, :current_health, :max_health, :attack, :defense, :energy_count, :money_count, :name
end
