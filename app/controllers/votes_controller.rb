class VotesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]

	def create
		
		pick = params["message"]#.strip.to_i
		from = params["from"]["endpoint"]

		puts "PICK: " + pick
		puts "FROM: " + from

		submission_exists = Submissions.where(identifier: pick).length > 0

		puts "SUBMISSION EXISTS: " + submission_exists

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