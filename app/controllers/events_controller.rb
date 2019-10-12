class EventsController < ApplicationController
	def index
		@time = Time.now

		@events = Event.all
	end
end
