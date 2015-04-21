class VotesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]

	def create
		pick = params["message"]
		from = params["from"]["endpoint"]

		submission_exists = Submission.where(identifier: pick).length > 0

		if submission_exists
			v = Vote.new
			v.pick = pick
			v.from = from
			v.save
		end

		render status: 200, nothing: true
	end

	def index
		@votes = Vote.all
	end
end