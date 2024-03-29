class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :role
  after_initialize :set_default_role
  has_many :programs


  def set_default_role
    self.role ||= "Applicant"
  end


end

