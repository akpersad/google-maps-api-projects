require 'pry'
require 'openssl'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class Runner

	attr_reader :status, :doc, :json, :origin, :destination, :url
	def call
	system("clear")
	puts "(At any point, enter 'Help' for the Help Menu or 'Exit' to exit the program.)"
	puts "Hello there!"
	puts "Welcome to our NYC Public Transportation Google Directions API Project." 
	run
	end

	def run
	puts "Please enter your where you will start your trip."
	start_trip = gets.chomp.downcase
		while start_trip == "help"
			puts "*Please enter where you would like to start your trip.*"
			puts "*Type 'Exit' if you want to exit the program.*"
			start_trip = gets.chomp.downcase
		end
		if start_trip == "exit"
			abort("BYE!")
		end
	puts "Thanks! Where do you plan to go?"
	end_trip = gets.chomp.downcase
		while end_trip == "help"
			puts "*Please enter where you would like to go.*"
			puts "*Type 'Exit' if you want to exit the program.*"
			end_trip = gets.chomp.downcase
		end
		if end_trip == "exit"
			abort("BYE!")
		end
	GoogleDirections.new(start_trip, end_trip)	
	end

end