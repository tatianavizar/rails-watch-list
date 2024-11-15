class FixcolumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :movies, :description, :overview
  end
end
