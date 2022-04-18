class User < ApplicationRecord
    has_secure_password
    has_one :rating
    has_one_attached :profileImage
    has_many :skills
    has_many :posts
    has_many :submissions
    
    # validates :name , presence: true , length:{ minimum:3 }
    # validates :password , presence: true , length:{ minimum:6 }
    # validate :image_file

    # private 

    # def image_file
    #     if profileImage.attached? && !profileImage.content_type.in?(%w(image/jpeg image/png))
    #         errors.add(:profileImage , "must be a jpeg or png file.")
    #     end
    # end

end
