class Vote < ActiveRecord::Base
	validates_presence_of :pick, :from
	validates_uniqueness_of :from
end