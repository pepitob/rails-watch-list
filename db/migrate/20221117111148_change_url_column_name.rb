class ChangeUrlColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :poster, :poster_url
  end
end
