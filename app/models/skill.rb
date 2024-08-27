class Skill < ApplicationRecord
    validates :name, presence: true
    belongs_to :user_skill, optional: true
end
