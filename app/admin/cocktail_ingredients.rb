ActiveAdmin.register CocktailIngredient do
  permit_params :cocktail_id, :ingredient_id

  index do
    selectable_column
    id_column
    column :cocktail
    column :ingredient
    column :created_at
    actions
  end

  filter :cocktail
  filter :ingredient
  filter :created_at

  form do |f|
    f.inputs do
      f.input :cocktail
      f.input :ingredient
    end
    f.actions
  end
end
