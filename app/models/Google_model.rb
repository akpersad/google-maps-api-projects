# require 'pry'
# require 'open-uri'
# require 'JSON'
# require 'yaml'
# require 'rest-client'
# require 'openssl'

# class DirectionsModel

#     def initialize(url)
# 		# binding.pry
# 		directions_hash = JSON.load(open(url, {OpenSSL::SSL::VERIFY_PEER => OpenSSL::SSL::VERIFY_NONE}))
# 		# binding.pry

# 		if directions_hash['status'] == 'OK'
# 			start_address = directions_hash['routes'][0]['legs'][0]['start_address']
# 			end_address = directions_hash['routes'][0]['legs'][0]['end_address']
# 			trip_time = directions_hash['routes'][0]['legs'][0]['duration']['text']
# 			travel_mode = directions_hash['routes'][0]['legs'][0]['steps'][1]['travel_mode']
# 			short_name = directions_hash['routes'][0]['legs'][0]['steps'][1]['transit_details']['line']['short_name']

# 			system("clear")
# 			puts "Beginning Address: " + start_address
# 			puts "Destination: " + end_address
# 			puts "\nYour trip will take #{trip_time}."
# 			puts "Here are your directions: \n \n"

# 			# binding.pry
# 			directions_hash['routes'][0]['legs'][0]['steps'].each_with_index do |instructions|
# 				if instructions['travel_mode'] == "TRANSIT"
# 					# binding.pry
# 					if instructions['html_instructions'].include?("Subway")
# 						puts "Ride the " + instructions['html_instructions'].gsub("Subway", "#{instructions['transit_details']['line']['short_name']} Train") + " for #{instructions['transit_details']['num_stops']} stops."
# 					elsif 
# 						puts "Ride the " + instructions['html_instructions'].gsub("Bus", "#{instructions['transit_details']['line']['short_name']} Bus") + " for #{instructions['transit_details']['num_stops']} stops."
# 					end	
# 				else
# 					puts instructions['html_instructions']
# 				end
# 			# binding.pry
# 			end
# 		else
# 			puts "You have entered an invalid address. Please go away."
# 			# binding.pry	
# 		end
# 	end
#   end

# end
