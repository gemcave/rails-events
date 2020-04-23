
require "rails_helper"

RSpec.describe Event, type: :model do
	before(:each) do
		@event = Event.new(name: "My Event", location: "Angel City", price: 19.00, starts_at: 1.days.from_now, description: "This is very interesting event in the world.") 
	end

  it "has a name" do
    expect(@event.name).to eq("My Event") 
	end
	it "has a description" do 
		expect(@event.description).to eq("This is very interesting event in the world.") 
	end
end