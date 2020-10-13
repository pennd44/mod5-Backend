class Enemy < ApplicationRecord
    has_many :enemy_skills
    has_many :enemy_items
    has_many :skills, through: :enemy_skills
    has_many :items, through: :enemy_items
    belongs_to :job, optional: true
end
