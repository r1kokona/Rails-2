class Skill < ApplicationRecord
    validates :name, presence: true
    has_many :user_skill
    has_many :user, through: :user_skill
end
