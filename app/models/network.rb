class Network < ActiveRecord::Base
	has_many :communities
  
  # Validations 
  validates :slug, presence: true
  validates :domain, presence: true
end
