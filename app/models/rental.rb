class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  belongs_to :subsidiary
  has_many :users

  enum status_rental: [ :scheduled, :in_progress ] 

  after_initialize :set_default_status_rental, :if => :new_record?
  after_initialize :ger_reservation_code, :if => :new_record?
  #after_initialize :get_subsidiary, :if => :new_record?

  def set_default_status_rental
    self.status_rental ||= :in_progress
  end
  

  #validate :end_date_must_be_greater_than_start_date
 
  #def end_date_must_be_greater_than_start_date
  #return unless
  #  if end_date < start_date
  #   errors.add(:end_date, 'deve ser maior que data inicial')
  #  end
  #end 
 
  def self.search(query)
    where("reservation_code like ?","%#{query}%")
  end

  def ger_reservation_code 
    self.reservation_code = rand(0..999999)
  end

  #def get_subsidiary
  #  subsidiary = subsidiary_id, @subsidiaries, :id, :name
  #end

end
