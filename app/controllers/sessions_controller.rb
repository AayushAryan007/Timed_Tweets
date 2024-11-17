# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
  end

  def create
    # Debugging line to check the received parameters
    Rails.logger.debug("Received email: #{params[:email]}")
  
    # Find the user by email
    user = User.find_by(email: params[:email])
  
    # Authenticate the user by checking if the password matches
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully!"
    else
      # If authentication fails, show an error message
      flash.now[:alert] = "Invalid email or password"
      render :new # Render the login form again
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
