class UsersController < ApplicationController

  before_action :get_user, only: [:edit, :update, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new get_params
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Sign Up Successfully'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end


  def update
    if @user.update get_params
      flash[:success] = 'Update Successfully'
      rendirect_to @user
    else
      render 'edit'
    end
  end

  def delete
    @user.destroy
    redirect_to @users
  end

  def show
  end


  private

  def get_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def require_user
    if current_user != @user
      flash[:notice] = 'You cannot edit others Profile.'
      redirect_to user_path(current_user)
    end
  end

end
