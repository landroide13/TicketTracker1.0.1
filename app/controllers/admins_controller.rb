class AdminsController < ApplicationController

  before_action :get_admin, only: [:edit, :update, :show, :delete]

  def index
    @tickets = Ticket.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new get_params
    if @admin.save
      session[:admin_id] = @admin.id
      flash[:success] = 'Sign Up Successfully'
      redirect_to @tickets
    else
      render 'new'
    end
  end

  def edit
  end


  def update
    if @admin.update get_params
      flash[:success] = 'Update Successfully'
      rendirect_to @admin
    else
      render 'edit'
    end
  end

  def delete
    @admin.destroy
    redirect_to root_path
  end

  def show
  end


  private 

  def get_params
    params.require(:admin).permit(:name,:email, :password, :password_confirmation)
  end

  def get_admin
    @admin = Admin.find(params[:id])
  end

  def require_admin
    if current_admin != @admin
      flash[:notice] = 'You cannot edit others Profile.'
      redirect_to admin_path(current_admin)
    end
  end




end