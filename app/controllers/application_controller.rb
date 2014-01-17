class ApplicationController < ActionController::Base
<<<<<<< HEAD
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
=======
  protect_from_forgery
  before_filter :authenticate_user!
  
  def after_sign_in_path_for(resource)
    # raise resource.inspect
  stored_location_for(resource) || trains_path
  
end

def after_sign_out_path_for(resource_or_scope)
  new_user_session_path
end
>>>>>>> 4a8ce979fa08b275175a00818938acf83923a916
end
