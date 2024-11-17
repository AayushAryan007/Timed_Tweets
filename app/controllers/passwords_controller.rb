class PasswordsController < ApplicationController
  before_action :require_user_logged_in!
  
  def edit
    @user = Current.user
  end

  def update
    @user = Current.user
    if @user.update(password_params)
      redirect_to root_path, notice: "Password updated successfully!"
    else
      flash.now[:alert] = "Please correct the errors below."
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end

