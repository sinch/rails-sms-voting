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

		render nothing: true
	end

	def index
	end

	def votes
		render json: data #{labels: ["Orange", "Banana", "Apple"], series: [[2, 4, 6]]}
	end

	private
	def data
		votes_counts = {}



		Vote.all.each do |v|
			submission = Submission.where(:identifier => v.pick).first.name
			if votes_counts[submission]
				votes_counts[submission] += 1
			else 
				votes_counts[submission] = 1
			end
		end

		graph_format = {labels: [], series: [[]]}

		votes_counts.each do |k, v|
			graph_format[:labels] << k
			graph_format[:series][0] << v
		end

		graph_format
	end
end