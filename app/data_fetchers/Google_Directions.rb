require 'pry'
require 'open-uri'
require 'JSON'
require 'yaml'
require 'rest-client'
require 'openssl'

class GoogleDirections

	attr_reader :status, :doc, :json, :origin, :destination, :url

	@@base_url = "https://maps.googleapis.com/maps/api/directions/json?"

	# @@default_values = {
	# 	:languages => :en,
	# 	:alternative => :false,
	# 	:mode => :transit
	# }

	def initialize(origin, destination)
		# keys = YAML.load_file('application.yml')
		# api_key = keys['API_Key']
		@origin = "origin=#{origin.gsub(/[\s,-.]/, "")}"
		@destination = "destination=#{destination.gsub(/[\s,-.]/, "")}"		
		@url = @@base_url + @origin + "&" + @destination + "&mode=transit&key="
		# binding.pry

		json_parse
		# test
	end

	def json_parse
		# binding.pry
		directions_hash = JSON.load(open(@url, {OpenSSL::SSL::VERIFY_PEER => OpenSSL::SSL::VERIFY_NONE}))
		# binding.pry

		if directions_hash['status'] == 'OK'
			start_address = directions_hash['routes'][0]['legs'][0]['start_address']
			end_address = directions_hash['routes'][0]['legs'][0]['end_address']
			first_step = directions_hash['routes'][0]['legs'][0]['steps'][0]['html_instructions']
			trip_time = directions_hash['routes'][0]['legs'][0]['duration']['text']

			
			puts "Your trip will take #{trip_time}."
			puts "Here are your directions: \n \n"

			
			directions_hash['routes'][0]['legs'][0]['steps'].each_with_index do |instructions|
				puts instructions['html_instructions']
			end
			# binding.pry
		else
			puts "You have entered an invalid address. Please go away."
			# binding.pry
		end
		# binding.pry
	end

	def test
		puts @url
	end
	# binding.pry
	# GoogleDirections.json_parse.read
end

# binding.pry
# puts "Hello there!"
# puts "Welcome to our NYC Public Transportation Google Directions API Project." 
# puts "Please enter your where you will start your trip from."
# 	start_trip = gets.chomp
# puts "Thanks! Where do you plan to go?"
# 	end_trip = gets.chomp
#  GoogleDirections.new(start_trip, end_trip)
#  @directions_hash