class RemovePhotoFromCocktails < ActiveRecord::Migration[5.2]
  def change
    remove_column :cocktails, :photo
  end
end
