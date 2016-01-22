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

  end

  def show
    @studio = Studio.find(params[:id])
    @studio_classes = @studio.yoga_classes.where("start  >= ?", Time.current - 6.hours).order("start")
    @next_class = @studio_classes.first
    @reviews = @studio.reviews
    
    @sum_rating = 0
    @reviews.each do |review|
      @sum_rating += review.rating
    end
    @average_rating = (@sum_rating.to_f / (@reviews.length)).round(1)

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
      logo_url: params[:logo_url],
      description: params[:description],
      class_schedule_link: params[:class_schedule_link],
      sign_up_link: params[:sign_up_link]
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
      # user_id: params[:user_id],
      logo_url: params[:logo_url],
      description: params[:description],
      class_schedule_link: params[:class_schedule_link],
      sign_up_link: params[:sign_up_link]
      )
    redirect_to "/studios/#{studio.id}"
  end

  def destroy
    studio = Studio.find_by(id: params[:id])
    studio.destroy
    redirect_to "/studios/"
  end

  def new_review
    if Review.where(user_id: params[:user_id]).where(studio_id: params[:studio_id]).any?
      flash[:alert] = "Sorry, you've already left a review for this studio!"
      redirect_to "/studios/#{params[:studio_id]}"
    else
      Review.create(
        user_id: params[:user_id],
        studio_id: params[:studio_id],
        rating: params[:rating],
        review: params[:review]
        )
      redirect_to "/studios/#{params[:studio_id]}"
    end
  end

  def destroy_review
    review = Review.find_by(id: params[:review_id])
    review.destroy
    redirect_to "/studios/#{params[:id]}"
  end

  def images
    @studio = Studio.find(params[:id])
    if @studio.studio_images.any?
      @images = @studio.studio_images
    end
  end

  def add_image
    StudioImage.create(
      studio_id: params[:studio_id],
      url: params[:url],
      )
    redirect_to "/studios/#{params[:studio_id]}/images"
  end

  def delete_image
    image = StudioImage.find(params[:img_id])
    studio_id = image.studio_id
    image.destroy
    redirect_to "/studios/#{studio_id}/images"
  end

# private
#   def authenticate_admin!
#     unless user_signed_in? && current_user.role_id == 1
#       flash[:alert] = "Sorry, you must be an admin to access studios!"
#       redirect_to "/"
#     end
#   end
end
