class RenameTypeToName < ActiveRecord::Migration[7.1]
  def change
    rename_column :types, :type, :name
  end
end
