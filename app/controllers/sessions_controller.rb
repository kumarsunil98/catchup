class SessionsController < ApplicationController
  layout 'login', only: [:new, :create]

  def new
  end

  def create
    if params[:session].present? && params[:session][:email].present?
      user = User.find_by(email: params[:session][:email])

      if user && user.authenticate(params[:session][:password])
        # Log in the user and handle the session (example: using sessions)
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in successfully!'
      else
        flash.now[:alert] = 'Invalid email/password combination.'
        render :new
      end
    else
      flash.now[:alert] = 'Email is required.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil # Log out the user (destroy the session)
    redirect_to root_path, notice: 'Logged out successfully!'
  end
end
