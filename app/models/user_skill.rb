class UserSkill < ApplicationRecord
    validates :user, presence: true
    validates :skill, presence: true
    belongs_to :user, optional: true
    belongs_to :skill, optional: true
end
