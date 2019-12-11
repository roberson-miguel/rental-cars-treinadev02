class User < ApplicationRecord
  belongs_to :subsidiary
  has_many :rentals, dependent: :destroy
  


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  

  enum role: [ :employed, :admin ]
  
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :employed
  end

end
