ActiveAdmin.register Cocktail do
  permit_params :name, :instructions, :glass

  index do
    selectable_column
    id_column
    column :name
    column :instructions
    column :glass
    column :created_at
    actions
  end

  filter :name
  filter :instructions
  filter :glass
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :instructions
      f.input :glass
    end
    f.actions
  end
end
