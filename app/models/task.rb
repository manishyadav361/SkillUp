class Task < ApplicationRecord
    has_many :addresses  , dependent:  :destroy
    has_many :submissions  , dependent:  :destroy
    has_many :participants , dependent: :destroy
    
    has_one_attached :taskImage , dependent: :destroy
    has_many_attached :docs , dependent:  :destroy

    validates :name , presence: true 
    validates :description , presence: true , length: { minimum: 100} 
    validates :time , presence: true
    validates :reward , presence: true
    validate :image_file
    validate :doc_file
    
    private 
    def image_file
        if taskImage.attached? && !taskImage.content_type.in?("%w (image/jpeg image/png)")
            errors.add(:taskImage , "can only be in jpeg/png format.")
        end
        if !taskImage.attached?
            errors.add(:taskImage , "is required.")
        end
    end

    def doc_file
        if !docs.attached? 
            errors.add(:docs , "cant be empty.")
        elsif docs.attached?
            docs.each do |doc|
                 !doc.content_type.in?(%w(application/text application/msword application/pdf))
            errors.add(:docs , "can only be in pdf/doc/excel format.")
        end
        end

    end
    
    
end
