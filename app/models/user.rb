class User < ApplicationRecord
    enum address1:{
    北海道:"1",青森県:"2",岩手県:"3",宮城県:"4",秋田県:"5",山形県:"6",福島県:"7",
    茨城県:"8",栃木県:"9",群馬県:"10",埼玉県:"11",千葉県:"12",東京都:"13",神奈川県:"14",
    新潟県:"15",富山県:"16",石川県:"17",福井県:"18",山梨県:"19",長野県:"20",
    岐阜県:"21",静岡県:"22",愛知県:"23",三重県:"24",
    滋賀県:"25",京都府:"26",大阪府:"27",兵庫県:"28",奈良県:"29",和歌山県:"30",
    鳥取県:"31",島根県:"32",岡山県:"33",広島県:"34",山口県:"35",
    徳島県:"36",香川県:"37",愛媛県:"38",高知県:"39",
    福岡県:"40",佐賀県:"41",長崎県:"42",熊本県:"43",大分県:"44",宮崎県:"45",鹿児島県:"46",
    沖縄県:"47"
    } 
    validates :id, presence: true, uniqueness: true
    validates :name, presence: true
    validates :ruby, presence: true
    validates :sex, presence: true, inclusion: { in: %w(男 女), message: "%{value} is not a valid sex" }
    validates :tel, allow_blank: true, format: { with: /\A0[-\d]{9,12}\z/, message: "must be a valid phone number" }
    validates :mobile, allow_blank: true, format: { with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/, message: "must be a valid mobile number" }
    validates :mail, presence: true, uniqueness: true, format: { with: /\A[\w+-.@?]+/i, message: "must be a valid email address" }
    validates :zip, presence: true, format: { with: /\A\d{3}-?\d{4}\z/, message: "must be a valid postal code" }  
    validates :address1, presence: true, inclusion: { in: address1s.keys }
    validates :birthday, presence: true

    belongs_to :department, optional: true
    has_many :user_skill
    has_many :skill, through: :user_skill
end