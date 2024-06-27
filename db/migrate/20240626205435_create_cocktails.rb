class CreateCocktails < ActiveRecord::Migration[7.1]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.text :instructions
      t.string :glass

      t.timestamps
    end
  end
end
