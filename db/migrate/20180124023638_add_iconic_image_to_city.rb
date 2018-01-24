class AddIconicImageToCity < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :iconic_image, :string
    add_column :cities, :caption, :string
  end
end
