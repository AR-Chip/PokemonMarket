class AddHstToProvince < ActiveRecord::Migration[7.0]
  def change
    add_column :provinces, :hst, :float
  end
end
