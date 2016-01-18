class Api::YogaClassesController < ApplicationController
  def index
    if params[:search].present? && params[:date].present?
      @yoga_classes = YogaClass.joins(:studio).near(params[:search], 4).where("start  >= ?", params[:date])
    elsif params[:search].present?
      @yoga_classes = YogaClass.joins(:studio).near(params[:search], 4).where("start  >= ?", Time.now)
    elsif params[:date].present?
      @yoga_classes = YogaClass.where("start  >= ?", params[:date])
    elsif params[:studio]
      @yoga_classes = YogaClass.where(studio_id: params[:studio]).where("start  >= ?", Time.now)
    elsif user_signed_in? && current_user.role_id == 2
      @yoga_classes = current_user.studio.first.yoga_classes.where("start  >= ?", Time.now)
    elsif user_signed_in? && current_user.role_id == 3
      @yoga_classes = current_user.yoga_classes.all.where("start  >= ?", Time.now)
    else
      @yoga_classes = YogaClass.all.where("start  >= ?", (Time.now))
    end
  end
end
