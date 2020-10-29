class Job < ApplicationRecord
    belongs_to :area
    has_one :enemy
end
