require './player.rb'

def welcome
puts "Welcome to Gio's Choose Your Own Adventure!"
puts "Play at your own risk!"
puts "Are you ready to play? (y/n)?"
input = gets.chomp 
	if input == 'y'
		prompt_user
	else 
		quit_game
	end 
end 


def prompt_user
	puts "Start Game? (y/n)"
	input = gets.chomp

	if input == 'y'
		start_game
	else
		prompt_user
	end
end

def start_game
  puts "You wake up in a Library with no memory of how you got there"
  puts 
  puts "It is dark"
  puts "Do you want to look around? (y/n)"
  input=gets.chomp 

 	if input == 'y'
  		look_around
 	else 
  		quit_game 
  	end
end

def look_around 
	puts "You find a cellphone but there is no service"
	puts 
	puts "What do you want to do? (1-Put it down/2-use the flashlight)"
	input =gets.chomp

	if input == '1' 
		puts"Ok, you have put the phone down."
		puts 
		puts "You find it difficult to see"
		search_more 
		@flashlight = false 
	else 
		@flashlight = true
		use_flashlight
	end
end 


def search_more 
	puts "You find a long corridor to your left"
	puts "Would you like to turn into the corridor? (y/n)"
	input =gets.chomp 
	
	if input =='y' 
		if @trip==true
			find_bar
		else 
			turn 
		end 
	end 
end 

def turn 
		puts "Ok, you have turned into the corridor"
		trip  
	if @flashlight ==true 
		trip
	else  
		puts "You find it difficult to see, you decide to turn back."
		look_around
	end 
end 

def trip
	if @trip == true 
	find_bar
	else 	
		puts "You tripped and sprained your ankle!"
		puts 
		puts"You are in pain"
		@trip = true 
		puts 
		puts "Do you want to turn back? (y/n)"
		input =gets.chomp
		if input == 'y' 
			find_stairs
		else 
			water_bottle
		end  
	end 
end 

def water_bottle 
	if @flashlight == true && @trip == true
		puts "Frustrated and confused you see a water bottle"
		puts 
		puts "This is what made you trip"
		puts 
		puts "Do you want to: "
		puts "1-Pick it up/ 2-Kick it away/3-Put on a shelf to keep you from tripping again"
		input =gets.chomp.to_i 

			if input == 1
				puts "Great!"
				@water_bottle = true
				keep_walking

			elsif input == 2
				puts "You feel better but decide to turn back"
				find_stairs

			else 
				puts "Nice, thinking!"
				@trip = 1 
				keep_walking
			end 
	else
		find_bar
	end 
end 

def find_bar 
	puts "You keep walking..."
	puts "You found an empty bar in the library, no one is there but you have access to a bottle of gin"
	puts "Do you want a sip (y/n)?"
	input = gets.chomp 
	if input == 'y'
		puts "How old are you?"
		input = gets.chomp.to_i
		@age = input
		if @age >21 || @age ==21
			puts "Awesome! You forget all about where you are and enjoy your gin"
			@sip = 1
			@drunk = true 
			stumble  
		else
			puts "You are under 21, but no one is around."
			puts "Would you like to drink anyways? (y/n)"
			input = gets.chomp 
			if input == 'y' 
				puts "This was all a moral test. You have failed."
				puts "The gin is really poison"
				user_dead 
			else 
				puts "Up to you..."
				walk_fire
			end
		end 
	else 
		puts "That's probably for the best..."
		find_monster
	end 
end 

def stumble 
	puts "You feel much better"
	puts "Take another sip? (y/n)"
	input = gets.chop 
	if input == 'y'
		@sip +=1
		stumble until @sip >5
		puts "You are dangerously drunk"
		puts "Do you have water?"
		if @water_bottle == true 
			rescue_user
		else
			user_dead
		end 
	else 
		puts "That's probably for the best..."
		search_more
	end 
end 

def keep_walking 
	puts"Going down the corridor you see a light"
	puts 
	puts"Would you like to 1-Head into the light/ 2-Turn back?"
	input = gets.chomp 

	if input =='1' 
		walk_fire 
	else 
		find_stairs
	end 
end 

def walk_fire 
	puts "You see a light!"
	puts
	puts"Salvation!!!!!!"
	puts
	puts "Salvation???????"
	puts 
	puts "DOOOM!!!!!!!!!!!!!!!!!!!!!!!!!!"
	puts 
	puts "As you run towards the light you realize it is really a FIRE!!"
	puts 
	puts "WAIT...."
	if @water_bottle == true 
		puts "You have a water bottle, use it to put out the fire!"
		rescue_user 
	else 
		puts "Running back you find a door!"
		find_door
	end 
end 

def turn_back
	if @flashlight == false 
		puts "Heading back you remember the lost cellphone"
		look_around 
	else 
		water_bottle
	end
end 

def find_stairs 
		puts
		puts "You stumble across a spirling staircaise, and decide to go up"
		puts 
		go_up
end 

def go_up 
	puts 
	puts "To the right there is what appears to be an elevator, would you like to get in (y/n)"
	puts 
	input = gets.chomp 

	if input == 'y'
		puts "Great!"
		@in_elevator = true
		elevator_decision
	else 
		puts
		@in_elevator=false
		puts "You go back down the stairs and into a corridor"
		keep_walking
	end 
end 

def elevator_decision
	@in_elevator = true 
	if @elevator_attempt >3
		puts 
		puts "Nothing seems to be working, you leave the elevator and keep on your journey"
		find_door
	elsif @drunk == false
		@elevator_attempt +=1
		puts
		puts "In the elevator, would you like to: "
		puts "1-Press L button to try and get home or 2-Try and use the emergency phone or 3-Go back?"
		input = gets.chomp 

		if input == '1'
			puts "You press L and wait"
			elevator_outcome 
		elsif input == '2'
			tone_dials
		else 
			look_into_books
		end 
	else 
		puts "Intoxicated, you sit down in desperation"
		desperation		
	end
end 

def tone_dials 
	puts "Great! The phone seems to be working, you wait as the tone dials"
	puts 
	puts"A deep voice picks up, would you like to ask for help? (y/n)"
	input = gets.chomp 
	if input == 'y'
		talk_monster 
	else 
		elevator_decision
	end 
end 

def talk_monster 
	puts 
	puts"You tell the deep voice where you are are hear an aweful laugh"
	puts 
	puts "Suddenly you are uneasy again, would you like to run away?(y/n)"
	input = gets.chomp 
	if input == 'y'
		search_more 
	else 
		find_monster
	end 
end 

def elevator_outcome
	puts 
	puts "The elavator doors close and you begin to move up"
	puts 
	puts "You start to feel relieved"
	puts 
	puts "Suddenly the elevator seeems to go dead"
	puts
	puts"Desperate and stuck inside do you:"
	puts "1-begin pressing buttons or 2-try the elevator phone?"
	input =gets.chomp 
	if input == '1'
		@in_elevator = true 
		desperation 
	else 
		tone_dials
	end
end 

def desperation 
	puts "You don't feel so good, you could really use some water..."
	if @in_elevator == false 
		go up
		
	elsif @in_elevator == true && @drunk == true
		tripping 
	else	
		puts "No avail"
		puts 
		puts "Minutes go by... "
		puts 
		puts "Hours... "
		puts 
		puts "You scream but noone can hear you... "
		puts 
		puts "You begin to feel clautrophobic and dehydrated"
		if @water_bottle == true 
			puts "You remember the water bottle and drink the water"
			@water_bottle = false 
			puts "You feel better automatically and are able to find an exit"
			rescue_user
		else 
			puts "Slowly, out of air and water you sit down depressed"
			puts 
			puts"You know it is only a matter of time now"
			user_dead
		end 
	end
end 	

def tripping 
	if @water_bottle == false 
		puts "Without water you become intoxicated by the alcohol"
	else 
		puts "You aren't feeling so well!"
		puts "Luckily you have some water"
		puts"You drink water and feel better"
		@water_botte = false 
		rescue_user
	end 
end

def look_into_books 
	if @flashlight == true 
		puts "Tired of strolling around with no avail you look around the shelves for a book on survival tips."
		puts 
		puts "You are in a Library after all"
		puts 
		puts "Using the flashlight you read in silence"
		puts
		puts "You hear a noise, would you like to run away? (y/n)"
		input =gets.chomp 
		if input=='y'
			puts "The cellphone's battery runs out and you are again left in the dark"
			@flashlight = false 
			desperation  
		else 
			walk_fire
		end 
	else 
		turn_back
	end 
end

def rescue_user 
	puts "You win"
	quit_game
end 

def use_flashlight 
	puts "You use the cellphone flashlight to guide you in your search"
	puts "It is still dark but you feel better"
	find_door
end 

def door_locked 
	puts "The Door is locked! Would you like to go back? (y/n)"
	input=gets.chomp 

	if input =='y'
		trip
	else 
		puts "You knock on the door and wait"
		open_door 
	end 
end 

def find_door 
	puts "You see a door, would you like to open it? (y/n)"
	input = gets.chomp 

	if input == 'y'
		door_locked
	else 
		search_more 
	end  
end 


def open_door 
	puts
	puts "You are turning away from the door when suddenly..."
	puts 
	puts"..."
	puts 
	puts "Oh no ..."
	find_monster
end 

def find_monster
	puts
	puts "A rabid monster opens door, would you like to run away (y/n)?"
	input =gets.chomp 

	if input == 'y' 
		keep_walking
	else 
		puts "The monster catches up to you and chews off your leg"
		puts 
		puts"You cry not only because of the pain but also because even if you live you will never walk again"
		puts
		puts "Depressed you give in to the monster's rage"
		if @water_bottle == true
			puts"The monster sees the water bottle on you and smiles"
			puts "This is all I wanted -- he says -- humans are 60% water and I am just so DAMN thirsty"
			puts 
			puts "The monster takes your water bottle and drinks happily"
			puts "He turns away and lets you live"
			rescue_user
		else 	
			user_dead
		end
	end 
end 

def user_dead 
	puts 
	puts"You lose!"
	puts 
	puts "Do you want to try again y/n? "
	input= gets.chomp 

	if input == 'y' 
		prompt_user
	else 
		quit_game
	end 
end  

def quit_game 
	puts"Are you sure you want to quit the game? (y/n)"
	input=gets.chomp 

	if input == 'y' 
		return false
	else 
	puts 
	puts"Play Again!!!"
	puts
	@age =0
	@sip =0
	@drunk = false 
	@elevator_attempt = 0 
	@water_bottle = false 
	@flashlight = false 
	@trip = false 
		prompt_user
	end 
end 