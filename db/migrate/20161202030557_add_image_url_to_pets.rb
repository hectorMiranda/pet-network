class AddImageUrlToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :image_url, :string
  end
end
