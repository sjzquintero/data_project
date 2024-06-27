ActiveAdmin.register Meal do
  permit_params :name, :instructions, :category

  index do
    selectable_column
    id_column
    column :name
    column :instructions
    column :category
    column :created_at
    actions
  end

  filter :name
  filter :instructions
  filter :category
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :instructions
      f.input :category
    end
    f.actions
  end
end
