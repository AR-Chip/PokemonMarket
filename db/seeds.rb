require 'csv'

PokemonType.destroy_all
Pokemon.destroy_all
Type.destroy_all

csv_data = File.read(Rails.root.join('db/pokemon-description.csv'))
pokemons_csv = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

(1..151).each do |i|
    pokemon_api = PokeApi.get(pokemon: i)

    pokemon = Pokemon.create(
        name: pokemon_api.name.capitalize,
        price: rand(10.0..100.0).round(2),
        pokedex_number: i,
        description: pokemons_csv[i - 1]['pokemon-description'],
        quantity: rand(1..30),
        image: pokemons_csv[i - 1]['pokemon-image-src']
    )

    pokemon_api.types.each do |type|
        type = Type.find_or_create_by(name: type.type.name)
        type.pokemons << pokemon
    end
end

puts "Created #{Pokemon.count} Pokemons"
puts "Created #{Type.count} Types"
