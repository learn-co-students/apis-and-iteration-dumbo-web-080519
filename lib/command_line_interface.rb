def welcome
  puts "Welcome to Star Wars fan page!"
end

def get_character_from_user
  puts "please enter a character name"
  user_response = gets.chomp
  user_response.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
