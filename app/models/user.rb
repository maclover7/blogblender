class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :entries
  has_many :comments
  
  # Validations 
  # validates :name, presence: true
  
  has_attached_file :profilepic, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end