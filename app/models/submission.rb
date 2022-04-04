class Submission < ApplicationRecord
    belongs_to :task 

    has_many_attached :docs , dependent: :destroy
    
end
