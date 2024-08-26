class UserSkill < ApplicationRecord
    validates :skill, presence: true
    has_many :user
    has_many :skill
end
