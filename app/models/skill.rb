class Skill < ApplicationRecord
    has_many :player_skills
    has_many :players, through: :player_skills
    has_many :enemy_skills
    has_many :enemies, through: :enemy_skills
    has_many :area_skills
    has_many :areas, through: :area_skills
end
