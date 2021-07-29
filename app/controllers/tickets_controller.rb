class TicketsController < ApplicationController
  before_action :get_ticket, only: [:edit, :update, :show, :delete]

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new get_params
    @ticket.user = current_user
    if @ticket.save
      flash[:success] = 'Ticket Successfully Created'
      redirect_to @user
    else
      render 'new'
    end
  end 

  def update
    if @ticket.update get_params
      flash[:success] = 'Update Successfully'
      rendirect_to @ticket
    else
      render 'edit'
    end
  end

  def edit
  end

  def delete
    @ticket.destroy
    redirect_to @ticket
  end

  private

  def get_ticket
    @ticket = Ticket.find(params[:id])
  end

  def get_params
    params.require(:ticket).permit(:description, :status, :response)
  end

end