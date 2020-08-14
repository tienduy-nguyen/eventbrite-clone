ActiveAdmin.register Event do

  permit_params :title, :start_date, :end_date, :start_at, :end_at, :price, :organizer_id, :category_id, :type_location, :is_publish, :max_quantity, :validated
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :start_date, :end_date, :start_at, :end_at, :price, :location, :organizer_id, :category_id, :type_location, :is_publish, :max_quantity, :validated]
  #   # permitted << :other if params[:action] == 'create' && current_user.admin?
  #   # permitted
  # end
  
end
