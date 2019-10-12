class EventsController < ApplicationController
	def index
		@time = Time.now

		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end

	def edit
		@event = Event.find(params[:id])
	end
	def update
		@event = Event.find(params[:id])
		event_params = params.require(:event).permit(:name,:description,:starts_at,:price,:location)
		@event.update(event_params)
		redirect_to @event
	end
end
