class CatRentalRequest < ApplicationRecord
  STATUSES = ['APPROVED', 'PENDING', 'DENIED']
  
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: {in: STATUSES} 
  validate :overlapping_requests
  
  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat,
    dependent: :destroy
    
  def overlapping_requests
    a = CatRentalRequest.where(cat_id: self.cat_id)
                    .where.not('start_date > :end_date', end_date: self.end_date)
                    .where.not('end_date < ?', self.start_date)
    if !a.empty?
      self.errors[:base] << "Cat is already rented during this time"
    end
  end
end

