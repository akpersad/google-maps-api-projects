require 'pry'
require 'open-uri'
require 'JSON'
require 'yaml'
require 'rest-client'

class GoogleDirections

	attr_reader :status, :doc, :json, :origin, :destination, :parameters

	@@base_url = "https://maps.googleapis.com/maps/api/directions/json?"

	@@default_values = {
		:languages => :en,
		:alternative => :false,
		:mode => :transit
	}

	def initialize(origin, destination, options=@@default_values)
		keys = YAML.load_file('application.yml')
		api_key = keys['API_Key']
		@origin = "origin=#{origin.gsub(/[\s,-.]/, "")}"
		@destination = "destination=#{destination.gsub(/[\s,-.]/, "")}"		
		@url = @@base_url + @origin + "&" + @destination + "&mode=transit&key=#{api_key}"
		@directions_hash = {}
	end

	def json_call
	  @url
	end

	def json_parse
		directions_hash = JSON.parse(open(@url))
		binding.pry
	end
	# binding.pry
	# GoogleDirections.json_parse.read
end
# puts "Hello there!"
# puts "Welcome to our NYC Public Transportation Google Directions API Project." 
# puts "Please enter your where you will start your trip from."
# 	start_trip = gets.chomp
# puts "Thanks! Where do you plan to go?"
# 	end_trip = gets.chomp
#  GoogleDirections.new(start_trip, end_trip)
#  @directions_hash