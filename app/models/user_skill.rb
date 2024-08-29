class UserSkill < ApplicationRecord
    validates :user, presence: true
    validates :skill, presence: true
    has_many :user
    has_many :skill
end
