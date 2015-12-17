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
