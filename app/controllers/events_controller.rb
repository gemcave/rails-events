class EventsController < ApplicationController
	def index
		@time = Time.now

		@events = Event.all
	end
	def show
		@event = Event.find(params[:id])
	end
end
