class Skill < ApplicationRecord
    validates :name, presence: true
    has_many :user_skill
end
