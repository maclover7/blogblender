class EntryType < ActiveRecord::Base
	has_many :entries

	validates_presence_of   :name, :description, :slug
    validates_uniqueness_of :slug
end
