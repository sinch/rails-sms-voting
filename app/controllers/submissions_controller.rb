class SubmissionsController < ApplicationController
	def new
		@submission = Submission.new
	end

	def create
		s = Submission.new
		s.identifier = params[:submission][:identifier]
		s.name = params[:submission][:name]
		s.save
		redirect_to submissions_path
	end

	def index
		@submissions = Submission.all
	end
end