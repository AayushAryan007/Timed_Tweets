class RegistrationsController < ApplicationController
  def new
    # instance variable to make it visible in views
    @user=User.new
  end
  
  def create
    
    @user = User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      redirect_to root_path, notice: "User successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

   
end
