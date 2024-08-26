class Department < ApplicationRecord
    validates :department_name, presence: true
    
    has_many :user
end
