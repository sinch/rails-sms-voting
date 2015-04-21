class Submission < ActiveRecord::Base
	validates_presence_of :identifier, :name
	validates_uniqueness_of :identifier, :name
end