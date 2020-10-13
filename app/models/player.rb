class Player < ApplicationRecord
    has_secure_password
    has_many :player_skills
    has_many :player_items
    has_many :skills, through: :player_skills
    has_many :items, through: :player_items
    belongs_to :map
    validates :username, uniqueness: {case_sensitive: false}
    validates :password, length: {minimum: 6}
end
