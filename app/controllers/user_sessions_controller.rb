#class SessionsController < ApplicationController
#  def create
#    auth = request.env["omniauth.auth"]
 #   user = User.find_by_provider_and_uid(auth["provider"], 
  #  auth["uid"]) || User.create_with_omniauth(auth)
   # session[:user_id] = user.id
#    redirect_to root_url, :notice => "Signed in!"
 # end
 
  #def destroy
   # session[:user_id] = nil
    #redirect_to root_url, :notice => "Signed out!"
#  end
#  end 

class UserSessionsController < ApplicationController
  layout :choose_layout
 
  def new
    @user_session = UserSession.new
  end
 
  def create

    if params[:origin] == "not omniauth"
      @user_session = UserSession.new(params[:user_session])
   
      if @user_session.save
        respond_to do |wants|
          wants.html { redirect_to user_path(@user_session.user) }
          wants.js { render :action => :redirect } # JavaScript to do the redirect
        end
      else
        respond_to do |wants|
          wants.html { render :new }
          wants.js # defaults to create.js.erb
        end
      end

    else
      auth = request.env["omniauth.auth"]
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Signed In!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed Out!"
  end
 
  private
  def choose_layout
    (request.xhr?) ? nil : 'application'
  end


end