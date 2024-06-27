ActiveAdmin.register MealIngredient do
  permit_params :meal_id, :ingredient_id

  index do
    selectable_column
    id_column
    column :meal
    column :ingredient
    column :created_at
    actions
  end

  filter :meal
  filter :ingredient
  filter :created_at

  form do |f|
    f.inputs do
      f.input :meal
      f.input :ingredient
    end
    f.actions
  end
end
