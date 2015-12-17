class YogaClassesController < ApplicationController
  def index
    @yoga_classes = YogaClass.all
  end

  def show
    @yoga_class = YogaClass.find_by(id: params[:id])
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
end
