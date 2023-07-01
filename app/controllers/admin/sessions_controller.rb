class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.password == params[:password]
      # Store the admin's id in the session to maintain the login state
      session[:user_id] = user.id
      redirect_to admin_pdf_files_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid email or password"
      redirect_to admin_pdf_files_path
    end
  end

  def destroy
    # Clear the session to log out the admin
    p 'debug'
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
