class User < ApplicationRecord
    validates :id, presence: true, uniqueness: true
    validates :name, presence: true
    validates :ruby, presence: true
    validates :sex, presence: true, inclusion: { in: %w(男 女), message: "%{value} is not a valid sex" }
    validates :tel, allow_blank: true, format: { with: /\A0[-\d]{9,12}\z/, message: "must be a valid phone number" }
    validates :mobile, allow_blank: true, format: { with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/, message: "must be a valid mobile number" }
    validates :mail, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
    validates :zip, presence: true, format: { with: /\A\d{3}-?\d{4}\z/, message: "must be a valid postal code" }  
    validates :address1, presence: true
    validates :birthday, presence: true
end