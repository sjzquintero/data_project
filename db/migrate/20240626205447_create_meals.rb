class CreateMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :instructions
      t.string :category

      t.timestamps
    end
  end
end
