class PersonalInformation < ApplicationRecord
    validates :id, presence: true, uniqueness: true
    validates :name, presence: true
    validates :ruby, presence: true
    validates :sex, presence: true, inclusion: { in: %w(男 女), message: "%{value} is not a valid sex" }
    validates :tel, presence: true, format: { with: /\A\d{10,11}\z/, message: "must be a valid phone number" }, length: { is: 10 }
    validates :mobile, presence: true, format: { with: /\A\d{10,11}\z/, message: "must be a valid mobile number" }, length: { is: 10 }
    validates :mail, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
    validates :zip, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "must be a valid postal code" }, length: { is: 7 }
    validates :address1, presence: true
    validates :address2, presence: true
    validates :address3, allow_blank: true
    validates :address4, allow_blank: true
    validates :address5, allow_blank: true
    validates :birthday, presence: true
end
