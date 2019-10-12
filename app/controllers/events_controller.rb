class EventsController < ApplicationController
	def index
		@time = Time.now

		@events = %w[Hackaton GamesJAM ComicCon BlizzCon]
	end
end
