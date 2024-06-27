ActiveAdmin.register Cocktail do
  permit_params :name, :instructions, :glass
end

# app/admin/meals.rb
ActiveAdmin.register Meal do
  permit_params :name, :instructions, :category
end

# app/admin/ingredients.rb
ActiveAdmin.register Ingredient do
  permit_params :name
end
