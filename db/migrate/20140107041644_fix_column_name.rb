class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :recipes, :method, :methodology
  end
end
