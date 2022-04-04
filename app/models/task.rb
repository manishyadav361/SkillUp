class Task < ApplicationRecord
    has_many :addresses  , dependent:  :destroy
    has_many :submissions  , dependent:  :destroy
    has_many :participants , dependent: :destroy
    
    has_one_attached :taskImage , dependent: :destroy
    has_many_attached :docs , dependent:  :destroy
    
end
