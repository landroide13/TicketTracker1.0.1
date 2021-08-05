class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.first_name}"
      redirect_to user
    else
      flash.now[:notice] = "Ups Try Again.."
      render 'new'
    end 
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Bye.." 
    redirect_to root_path
  end


  def signin
  end

  def signin_admin
    admin = Admin.find_by(email: params[:sessions][:email].downcase)
    if admin && admin.authenticate(params[:sessions][:password])
      session[:admin_id] = admin.id
      flash[:notice] = "Welcome #{admin.name}"
      redirect_to admin
    else
      flash.now[:notice] = "Ups Try Again.."
      render 'signin'
    end 
  end

  def signout_admin
    session[:admin_id] = nil
    flash[:notice] = "Bye.." 
    redirect_to root_path
  end



end


