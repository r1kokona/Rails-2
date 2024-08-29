class Department < ApplicationRecord
    validates :department_name, presence: true
    
    belongs_to :user, optional: true
end
