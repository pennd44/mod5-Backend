class Area < ApplicationRecord
  belongs_to :map
  has_many :area_skills
  has_many :area_items
  has_many :jobs
  # has_many :skills through: :area_skills
  # has_many :equipables through: :area_equipables


end
