COLORS = [
  'grey',
  'orange',
  'black',
  'white'
]

class Cat < ApplicationRecord
  
  def self.colors 
    COLORS
  end
  
  validates :name, presence: true
  validates :color, inclusion: { in: COLORS }
  
  has_many :rental_requests,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest
end
