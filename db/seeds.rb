Pokemon.destroy_all
Type.destroy_all

# (1..150).each do |id|
#   pokemon_name = PokeApi.get(pokemon: id)

#   puts pokemon.name
#   # Pokemon.create!(
#   #   name:       pokemon.name.capitalize,
#   #   base_price: rand(10.0..100.0) # Set a random base price for each Pokémon
#   # )
# end

pokemon_name = PokeApi.get(pokemon: 3).name
pokemon_description = PokeApi.get(characteristic: 3).descriptions[7].description

puts pokemon_name
puts pokemon_description
