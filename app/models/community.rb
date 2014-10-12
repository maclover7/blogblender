class Community < ActiveRecord::Base
	belongs_to :network

	has_many :entries

  # Validations 
  validates :name, presence: true
  validates :domain, presence: true
  validates :twitter_name, presence: true
  validates :facebook_url, presence: true
  validates :network_id, presence: true
  
end
