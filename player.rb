require './game.rb'
require './start.rb'

class Player 

	attr_accessor :water_bottle, :first_name, :flash_light, :elevator_attempt, :trip, :drunk, :age, :sip
	@sip = 0
	@age = 0
	@drunk= false
	@trip = false
	@in_elevator
	@elevator_attempt = 0
	@water_bottle = false 
	@flash_light = false
	puts "What is your player's name?"
	@first_name = gets.chomp 
	puts "Great #{@first_name}! Let's get started"
	puts
	welcome 
	
end 
