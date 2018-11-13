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
end
