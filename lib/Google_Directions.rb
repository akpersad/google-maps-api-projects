require 'pry'

class GoogleDirections

	@@base_url = "https://maps.googleapis.com/maps/api/directions/json?"

	def initialize(origin, destination)
		@origin = origin
		@destination = destination
	end


end
 # binding.pry