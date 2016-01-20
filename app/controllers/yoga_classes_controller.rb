class YogaClassesController < ApplicationController
  def home
    if params[:search].present?
      redirect_to "/yoga_classes/?search=#{params[:search]}"
    end
  end
  def index
    # if params[:studio]
    #   @yoga_classes = YogaClass.where(studio_id: params[:studio])
    # elsif user_signed_in? && current_user.role_id == 1
    #   @yoga_classes = YogaClass.all
    # elsif user_signed_in? && current_user.role_id == 2
    #   @yoga_classes = current_user.studio.first.yoga_classes
    # elsif user_signed_in? && current_user.role_id == 3
    #   @yoga_classes = current_user.yoga_classes.all
    # else
    #   @yoga_classes = YogaClass.all
    # end
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
    @hash = Gmaps4rails.build_markers(@yoga_classes) do |yoga_class, marker|
      marker.lat yoga_class.studio.latitude
      marker.lng yoga_class.studio.longitude
      marker.infowindow yoga_class.studio.name
      marker.picture({
        "url": "http://www.icon100.com/up/2891/48/yoga.png",
        "width":  48,
        "height": 48
        })
    end
  end

  def show
    @yoga_class = YogaClass.find_by(id: params[:id])
    @central_time = @yoga_class.start + 6.hours
  end

  def new
    # @studio_teachers = current_user.studio.users
    if user_signed_in? && 
      (current_user.role_id == 1 || current_user.role_id == 2)
      @studios = Studio.all
      @studio = current_user.studio
      @all_teachers = User.where(role_id: 3)
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
      start: DateTime.parse(params[:date] + " " + params[:time]),
      duration: params[:duration],
      price: params[:price],
      level: params[:level],
      style: params[:style],
      user_id: params[:user_id]
      )
    redirect_to "/yoga_classes/#{yoga_class.id}"
  end

  def edit
    # if current user is admin or studio owner or teacher
    @yoga_class = YogaClass.find_by(id: params[:id])
    @studios = Studio.all
    @studio = current_user.studio
    @all_teachers = User.all.where(role_id: 3)
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
      start: DateTime.parse(params[:date] + " " + params[:time]),
      duration: params[:duration],
      price: params[:price],
      level: params[:level],
      style: params[:style],
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
