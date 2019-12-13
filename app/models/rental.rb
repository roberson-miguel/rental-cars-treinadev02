class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  belongs_to :subsidiary
  belongs_to :car
  belongs_to :car_model
  has_many :users
  
  #has_one :car_rental
  #has_one :car, through: :car_rental

  enum status_rental: [ :scheduled, :in_progress ] 

  after_initialize :set_default_status_rental, :if => :new_record?
  after_initialize :ger_reservation_code, :if => :new_record?
  after_initialize :get_subsidiary, :if => :new_record?

  def set_default_status_rental
    self.status_rental ||= :in_progress
  end

  def ger_reservation_code 
    self.reservation_code = rand(0..999999)
  end
  

  validate :end_date_must_be_greater_than_start_date
 
  def end_date_must_be_greater_than_start_date
    return unless start_date.present? && end_date.present?
    if end_date <= start_date
     errors.add(:end_date, 'deve ser maior que data inicial')
    end
  end 

  def start_date_equal_or_greater_than_today
    return unless start_date.present? 
      if start_date < Date.current
       errors.add(:start_date, 'deve ser maior que data de hoje')
      end
  end 
 
  def cars_available
    return unless start_date.present? && end_date.present?
      if cars_available_at_date_range
       errors.add(:end_date, 'deve ser maior que data de hoje')
      end
  end 

  
  def get_subsidiary
    subsidiary = subsidiary_id, @subsidiaries, :id, :name
  end

end
