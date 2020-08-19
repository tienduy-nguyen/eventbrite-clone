ActiveAdmin.register Event do

  permit_params :title, :start_date, :end_date, :price, :organizer_id, :category_id, :type_location, :is_publish, :validated
  
  index do
    selectable_column
    id_column
    column :title
    column :start_date
    column :end_date
    column :price
    column :organizer_id
    column :category_id
    column :is_publish
    column :validated
    actions
  end

  filter :start_date
  filter :end_date
  filter :price
  filter :organizer_id
  filter :category_id
  filter :is_publish
  filter :validated


  form do |f|
    f.inputs "Event Details" do
      f.input :title
      f.input :start_date
      f.input :end_date
      f.input :price
      f.input :is_publish
      f.input :validated
      # more fields
    end
    f.actions
  end

end
