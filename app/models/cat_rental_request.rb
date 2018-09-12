# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#

class CatRentalRequest < ApplicationRecord
  STATUSES = ['PENDING', 'APPROVED', 'DENIED']
  
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: STATUSES, message: 'Invalid status' }
  
  belongs_to :cat,  
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat
    
  def overlapping_requests
    CatRentalRequest.where('cat_id = ?', self.cat_id)
                    .where('start_date BETWEEN ? AND ?', self.start_date, self.end_date)
                    .where('start_date = ?', self.start_date)
                    .where('start_date = ?', self.end_date)
                    .where('id != ?', self.id)
  end
  
  def overlapping_approved_requests
    overlapping_requests.where("status = 'APPROVED'")
  end
  
  def does_not_overlap_approved_request
    return true if overlapping_approved_requests.empty?
    return false
  end
  
end

