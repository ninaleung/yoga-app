class SavedClassesController < ApplicationController
  before_action :authenticate_user!

  def index

    if current_user && current_user.saved.where("start  >= ?", Time.now).any? && current_user.saved_classes.where(status: "saved").any?
      @saved_classes = current_user.saved_classes.where(status: "saved")
      @current_saved_classes = current_user.saved.where("start  >= ?", Time.now)
    else
      flash[:warning] = "You don't have any saved classes. Browse available yoga classes!"
      redirect_to "/yoga_classes"
    end
  end

  def create
      user_id = current_user.id
      yoga_class_id = params[:yoga_class_id]
    if SavedClass.where(user_id: user_id, yoga_class_id: yoga_class_id, status: "saved").any?
      flash[:warning] = "You've already saved this class!"
      redirect_to "/yoga_classes/#{params[:yoga_class_id]}"
    else
      SavedClass.create(
        user_id: user_id,
        yoga_class_id: yoga_class_id,
        status: "saved"
      )
      redirect_to "/saved_classes/calendar"
    end
  end

  def destroy
    saved_class = SavedClass.find_by(id: params[:id])
    saved_class.update(status: "removed")
    flash[:success] = "Removed class!"
    redirect_to "/saved_classes/calendar"
  end

  def calendar
    @saved_classes = current_user.saved_classes.where(status: "saved")
  end
end
