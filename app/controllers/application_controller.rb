class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # add the code shown below:

  helper_method :current_user
 	#<%= stylesheet_link_tag ‘application’ %>
	#<%= stylesheet_link_tag ‘modalbox’ %> 
	#<%= JavaScript_include_tag :defaults %>
	#<%= JavaScript_include_tag ‘modalbox’%>
  

  private
 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
           

end



