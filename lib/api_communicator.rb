require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  
  url = 'http://www.swapi.co/api/people/'
  character_hash = nil
  
  loop do

    response_string = RestClient.get(url).body
    response_hash = JSON.parse(response_string)
    character_hash = response_hash["results"].find do |character|
      character["name"].downcase == character_name
    end
    
  
    if character_hash
      break
    elsif !response_hash["next"]
      break
    else
      url = response_hash["next"]
    end
  end

  if character_hash
    character_hash["films"].map do |film|
      response_string = RestClient.get(film).body
      response_hash = JSON.parse(response_string)
      response_hash
    end
  else
    return nil
  end

end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each_with_index do |film, index|
    puts "#{index + 1}. #{film["title"]}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  if films
    print_movies(films)
  else
    puts "Invalid character."
    character = get_character_from_user
    show_character_movies(character)
  end
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
