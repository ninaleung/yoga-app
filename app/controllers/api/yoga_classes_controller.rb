class Api::YogaClassesController < ApplicationController
  def index
    if params[:search].present?
      @yoga_classes = YogaClass.joins(:studio).near(params[:search], 4).where("start  >= ?", Time.current - 6.hours)
    elsif params[:studio]
      @yoga_classes = YogaClass.where(studio_id: params[:studio]).where("start  >= ?", Time.current - 6.hours)
    elsif user_signed_in? && current_user.role_id == 2
      @yoga_classes = current_user.studio.first.yoga_classes.where("start  >= ?", Time.current - 6.hours)
    elsif user_signed_in? && current_user.role_id == 3
      @yoga_classes = current_user.yoga_classes.all.where("start  >= ?", Time.current - 6.hours)
    else
      @yoga_classes = YogaClass.where("start  >= ?", Time.current - 6.hours)
    end
  end
end
