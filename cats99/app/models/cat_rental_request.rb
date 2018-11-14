class CatRentalRequest < ApplicationRecord
  STATUSES = ['APPROVED', 'PENDING', 'DENIED']
  
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: {in: STATUSES} 
  validate :does_not_overlap_approved_request
  
  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat,
    dependent: :destroy
    
  def overlapping_requests
    CatRentalRequest.where(cat_id: self.cat_id)
                    .where.not('start_date > :end_date', end_date: self.end_date)
                    .where.not('end_date < ?', self.start_date)

  end
  
  def overlapping_approved_requests
    overlapping_requests.where("status = 'APPROVED'")
  end
  
  def does_not_overlap_approved_request
    if !overlapping_approved_requests.empty?
      self.errors[:base] << "Cat is already rented during this time"
    end
  end
  
  def overlapping_pending_requests
    overlapping_requests.where("status = 'PENDING'")
  end  
  
  def approve!
    self.update_attributes(status: 'APPROVED')
    overlapping_pending_requests.each { |el| el.deny! }
  end
  
  def deny!
    self.update_attributes(status: 'DENIED')
  end
end

