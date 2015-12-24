class StudiosController < ApplicationController
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
end
