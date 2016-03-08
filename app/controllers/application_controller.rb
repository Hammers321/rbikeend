class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  

 def initialize_cart
   @cart = Cart.build_from_hash session
 end

 def authenticate_admin!
    authenticate_user!

    unless current_user.admin?
      redirect_to root_path, alert: "you are not permit to perform this operation"
   end
 end
end
