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
		if start_trip == "help"
			puts "Please enter where you would like to start your trip."
			start_trip = gets.chomp.downcase
		elsif start_trip == "exit"
			abort("BYE!")
		end
	puts "Thanks! Where do you plan to go?"
	end_trip = gets.chomp.downcase
		if end_trip == "Please enter where you would like to go."
			puts "Hello"
			end_trip = gets.chomp.downcase
		elsif end_trip == "exit"
			abort("BYE!")
		end
		if end_trip == 'Go Back'
			puts "Please enter your where you will start your trip from."
			start_trip = gets.chomp
			puts "Thanks! Where do you plan to go?"
		end_trip = gets.chomp
		end
	GoogleDirections.new(start_trip, end_trip)	
	end

end