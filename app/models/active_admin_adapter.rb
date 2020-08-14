class ActiveAdminAdapter < ActiveAdmin::AuthorizationAdapter
  def authorized?(action, subject = nil)
    user.is_admin == true
  end
end