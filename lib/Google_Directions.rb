require 'pry'
require 'open-uri'
require 'JSON'
require 'yaml'

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
	end

	def json_call
	  @url
	end
end