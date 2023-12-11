ActiveAdmin.register Pokemon do
  permit_params :pokemon_id, :name, :description, :pokedex_number, :price, :quantity,
                :sale_percentage, :image, :created_at, :updated_at, :pokemon_image, type_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :pokedex_number
    column :price
    column :quantity
    column :sale_percentage
    column :types do |pokemon|
      pokemon.types.map(&:name).join(", ")
    end
    column :image
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Pokemon Details" do
      f.input :pokemon_id
      f.input :name
      f.input :description
      f.input :pokedex_number
      f.input :price
      f.input :quantity
      f.input :sale_percentage
      f.input :image
      f.input :types, as: :check_boxes, collection: Type.all
      f.input :created_at
      f.input :updated_at
      f.input :pokemon_image, as:   :file,
                              hint: f.object.pokemon_image.present? ? image_tag(f.object.pokemon_image.variant(resize_to_limit: [250, 250])) : nil
    end
    f.actions
  end
end
