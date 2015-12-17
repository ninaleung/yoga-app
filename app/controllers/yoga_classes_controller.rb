class YogaClassesController < ApplicationController
  def index
    @yoga_classes = YogaClass.all
  end

  def show
    @yoga_class = YogaClass.find_by(id: params[:id])
  end

  def new
    # if current user is admin or studio owner
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
  end

  def update
    # if current user is admin or studio owner or teacher
  end

  def destroy
    # if current user is admin or studio owner
  end
end
