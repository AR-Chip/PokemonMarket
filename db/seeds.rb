require "csv"

User.destroy_all
Province.destroy_all
PokemonType.destroy_all
Pokemon.destroy_all
Type.destroy_all
AdminUser.destroy_all
StaticPage.destroy_all

csv_data = File.read(Rails.root.join("db/pokemon-description.csv"))
pokemons_csv = CSV.parse(csv_data, headers: true, encoding: "utf-8")

(1..151).each do |i|
  pokemon_api = PokeApi.get(pokemon: i)

  pokemon = Pokemon.create(
    name:           pokemon_api.name.capitalize,
    price:          rand(10.0..100.0).round(2),
    pokedex_number: i,
    description:    pokemons_csv[i - 1]["pokemon-description"],
    quantity:       rand(1..30),
    sale_percentage: 0,
    image:          pokemons_csv[i - 1]["pokemon-image-src"]
  )

  pokemon_api.types.each do |type|
    type = Type.find_or_create_by(name: type.type.name)
    type.pokemons << pokemon
  end
end

Province.create(name: "Ontario", code: "ON", pst: 0.08)
Province.create(name: "Quebec", code: "QC", pst: 0.09975)
Province.create(name: "Nova Scotia", code: "NS", pst: 0.1)
Province.create(name: "New Brunswick", code: "NB", pst: 0.1)
Province.create(name: "Manitoba", code: "MB", pst: 0.07)
Province.create(name: "British Columbia", code: "BC", pst: 0.07)
Province.create(name: "Prince Edward Island", code: "PE", pst: 0.1)
Province.create(name: "Saskatchewan", code: "SK", pst: 0.06)
Province.create(name: "Alberta", code: "AB", pst: 0)
Province.create(name: "Newfoundland and Labrador", code: "NL", pst: 0.1)
Province.create(name: "Northwest Territories", code: "NT", pst: 0)
Province.create(name: "Yukon", code: "YT", pst: 0)
Province.create(name: "Nunavut", code: "NU", pst: 0)

puts "Created #{Pokemon.count} Pokemons"
puts "Created #{Type.count} Types"
if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
                    password_confirmation: "password")
end

# For Editing Static pages
StaticPage.create(title: "About Us", content: "Welcome to the About Us page content.")
StaticPage.create(title: "Contact Us", content: "Welcome to the Contact Us page content.")
