require_relative "api_communicator"

def welcome
  puts "Welcome to Star Wars character search."
end

def get_character_from_user
  puts "Please enter a character name."
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp.downcase
end

def run_search
  welcome
  character = get_character_from_user
  show_character_movies(character)
end

run_search