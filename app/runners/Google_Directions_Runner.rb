require 'pry'
require 'openssl'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class Runner

	def call
	system("clear")
	puts "Hello there!"
	puts "Welcome to our NYC Public Transportation Google Directions API Project." 
	run
	end

	def run
	puts "Please enter your where you will start your trip from."
	start_trip = gets.chomp
	puts "Thanks! Where do you plan to go?"
	end_trip = gets.chomp
	GoogleDirections.new(start_trip, end_trip)	
	end

end