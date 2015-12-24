class StudiosController < ApplicationController
before_action :authenticate_admin!

  def index
    @studios = Studio.all
  end

  def show
    @studio = Studio.find(params[:id])
  end

  def new
  end

  def create
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
