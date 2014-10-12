class Comment < ActiveRecord::Base
	belongs_to :entry
	belongs_to :user
  
  # Validations
  validates :content, presence: true

end
