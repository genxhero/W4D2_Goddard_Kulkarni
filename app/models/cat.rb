# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#['Black', 'Gray', 'White', 'Brown', 'Orange', 'Calico']

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  
    COLORS =['Black', 'Gray', 'White', 'Brown', 'Orange', 'Calico', 'Tortoiseshell']
  
  validates :birth_date, :color, :name, :sex, :description, presence: true
  
  validates :sex, inclusion: { in: %w(M F), message: "Invalid sex- choose from M or F" }
  
  validates :color, inclusion: { in: COLORS, message: "Invalid color- choose from our preset colors"  }
                    
  def age
    age = Time.now.year - birth_date.year
  end
  
  def colors
    COLORS
  end
  
  has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy
  
end 
