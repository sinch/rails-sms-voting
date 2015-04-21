class VotesController < ApplicationController
	def create
		pick = params["message"].strip
		from = params["from"]["endpoint"]

		submission_exists = Submissions.where(identifier: pick).length

		if submission_exists
			v = Vote.new
			v.pick = pick
			v.from = from
			v.save
		end
	end

	def index
		@votes = Vote.all
	end
end