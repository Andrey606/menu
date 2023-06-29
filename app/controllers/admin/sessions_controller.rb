class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # Store the admin's id in the session to maintain the login state
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    # Clear the session to log out the admin
    session[:user_id] = nil
    redirect_to admin_sessions_new_path, notice: "Logged out successfully!"
  end
end
