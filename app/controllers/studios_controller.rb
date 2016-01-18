class StudiosController < ApplicationController
# before_action :authenticate_admin!

  def index
    if params[:search].present?
      @studios = Studio.near(params[:search], 4)
    elsif params[:filter].present?
      @studios = Studio.where("lower(name) LIKE ?", "%#{params[:filter].downcase}%")
    else
      @studios = Studio.all.order(:name)
    end

    # @chicago_studios = ChicagoYogaStudios::Business.all
  end

  def show
    @studio = Studio.find(params[:id])
    @studio_classes = @studio.yoga_classes.where("start  >= ?", Time.now - 6.hours)
    @next_class = @studio_classes.first
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
    @studio = Studio.find_by(id: params[:id])
    @owners = User.where(role_id: 2)
  end

  def update
    studio = Studio.find_by(id: params[:id])
    studio.update(
      name: params[:name],
      address: params[:address],
      phone: params[:phone],
      email: params[:email],
      website: params[:website],
      user_id: params[:user_id],
      )
    redirect_to "/studios/#{studio.id}"
  end

  def destroy
    studio = Studio.find_by(id: params[:id])
    studio.destroy
    redirect_to "/studios/"
  end

# private
#   def authenticate_admin!
#     unless user_signed_in? && current_user.role_id == 1
#       flash[:alert] = "Sorry, you must be an admin to access studios!"
#       redirect_to "/"
#     end
#   end
end
