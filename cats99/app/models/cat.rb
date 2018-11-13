COLORS = [
  'grey',
  'orange',
  'black',
  'white',
]

class Cat < ApplicationRecord
  validates :name, presence: true
  validates :color, inclusion: { in: COLORS }
end
