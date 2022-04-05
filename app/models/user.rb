class User < ApplicationRecord
    has_one :rating
    has_secure_password
    has_one_attached :profileImage
    has_many :skills

    validates :email, presence: true , uniqueness: true
    validates :password, presence: true 
    validates :profileImage , presence: true
end
