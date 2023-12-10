class CreateProvinces < ActiveRecord::Migration[7.0]
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :code
      t.float :pst

      t.timestamps
    end
  end
end
