class Address < ApplicationRecord
  # belongs_to :submission
  belongs_to :task
  validates :link , presence: true 
  validates :title , presence: true
  
end
