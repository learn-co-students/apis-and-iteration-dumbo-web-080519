require_relative "api_communicator"

def welcome
  # puts out a welcome message here!
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp.downcase
end



binding.pry


character = get_character_from_user
show_character_movies(character)
