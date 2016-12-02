class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :sex
      t.integer :age
      t.string :slug

      t.timestamps
    end
    add_index :pets, :slug, unique: true
  end
end
