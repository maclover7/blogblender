class Entry < ActiveRecord::Base
	belongs_to :community
	belongs_to :user

	has_many :comments
  
  # Validations
  validates :title, presence: true
  validates :body, presence: true
  #validates :community_id, presence: true
  validates :entry_type, presence: true

	# Tagging Features
		has_many :taggings
	  	has_many :tags, through: :taggings
	  	def self.tagged_with(name)
	    	Tag.find_by_name!(name).entries
	  	end
	  	def self.tag_counts
	    	Tag.select("tags.*, count(taggings.tag_id) as count").
	      	joins(:taggings).group("taggings.tag_id")
	  	end
	  	def tag_list
	    	tags.map(&:name).join(", ")
	  	end
	  	def tag_list=(names)
	    	self.tags = names.split(",").map do |n|
	      		Tag.where(name: n.strip).first_or_create!
	    	end
	  	end


end