class Community < ActiveRecord::Base
	belongs_to :network

	has_many :entries
end
