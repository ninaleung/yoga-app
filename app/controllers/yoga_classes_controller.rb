class YogaClassesController < ApplicationController
  def index
    if params[:studio]
      @yoga_classes = YogaClass.where(studio_id: params[:studio])
    elsif user_signed_in? && current_user.role_id == 1
      @yoga_classes = YogaClass.all
    elsif user_signed_in? && current_user.role_id == 2
      @yoga_classes = current_user.studio.first.yoga_classes
    elsif user_signed_in? && current_user.role_id == 3
      @yoga_classes = current_user.yoga_classes.all
    else
      @yoga_classes = YogaClass.all
    end
  end

  def show
    @yoga_class = YogaClass.find_by(id: params[:id])
  end

  def new
    @studios = Studio.all
    @studio = current_user.studio
    @teachers = User.where(role_id: 3)
    # @studio_teachers = current_user.studio.first.users
    if user_signed_in? && 
      (current_user.role_id == 1 || current_user.role_id == 2)
      :new
    else
      flash[:alert] = "Sorry, you must be an admin or studio owner!"
      redirect_to "/yoga_classes"
    end
  end

  def create
    # if current user is admin or studio owner
    yoga_class = YogaClass.create(
      name: params[:name],
      studio_id: params[:studio_id],
      date: params[:date],
      time: params[:time],
      duration: params[:duration],
      price: params[:price],
      level: params[:level],
      user_id: params[:user_id]
      )
    redirect_to "/yoga_classes/#{yoga_class.id}"
  end

  def edit
    # if current user is admin or studio owner or teacher
    @yoga_class = YogaClass.find_by(id: params[:id])
    @studios = Studio.all
    @studio = current_user.studio
    if user_signed_in? && 
      (current_user.role_id == 1 || current_user.role_id == 2 || current_user.role_id == 3)
      :edit
    else
      flash[:alert] = "Sorry, you must be an admin, studio owner, or teacher!"
      redirect_to "/yoga_classes/#{params[:id]}"
    end
  end

  def update
    # if current user is admin or studio owner or teacher
    yoga_class = YogaClass.find_by(id: params[:id])
    yoga_class.update(
      name: params[:name],
      # studio_id: params[:studio_id],
      date: params[:date],
      time: params[:time],
      duration: params[:duration],
      price: params[:price],
      level: params[:level],
      user_id: params[:user_id]
      )
    redirect_to "/yoga_classes/#{yoga_class.id}"
  end

  def destroy
    # if current user is admin or studio owner
    yoga_class = YogaClass.find_by(id: params[:id])
    if user_signed_in? && 
      (current_user.role_id == 1 || current_user.role_id == 2)
      yoga_class.destroy
      flash[:success] = "Class was successfully deleted!"
      redirect_to "/yoga_classes/"
    else
      flash[:alert] = "Sorry, you must be an admin or studio owner!"
      redirect_to "/yoga_classes/#{yoga_class.id}"
    end
  end
end
