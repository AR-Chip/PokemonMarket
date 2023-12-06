ActiveAdmin.register Pokemon do
  permit_params :pokemon_id, :name, :description, :pokedex_number, :price, :quantity,
                :sale_percentage, :image, :type_id
end
