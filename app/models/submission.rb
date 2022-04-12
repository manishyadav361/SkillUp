class Submission < ApplicationRecord
    belongs_to :task 
    belongs_to :user
    has_many_attached :docs , dependent: :destroy
    
    validates :description , presence: true
end
