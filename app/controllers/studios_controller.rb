class StudiosController < ApplicationController
before_action :authenticate_admin!

  def index
    @studios = Studio.all
  end

  def show
    @studio = Studio.find(params[:id])
  end

  def new
    @owners = User.where(role_id: 2)
  end

  def create
    studio = Studio.create(
      name: params[:name],
      address: params[:address],
      phone: params[:phone],
      email: params[:email],
      website: params[:website],
      user_id: params[:user_id],
      )
    redirect_to "/studios/#{studio.id}"
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def authenticate_admin!
    unless user_signed_in? && current_user.role_id == 1
      flash[:alert] = "Sorry, you must be an admin to access studios!"
      redirect_to "/"
    end
  end
end
