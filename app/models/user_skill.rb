class UserSkill < ApplicationRecord
    has_many :user
    has_many :skill
end
