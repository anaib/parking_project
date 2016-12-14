class PublicParkingSpotsController < ApplicationController
  before_action :current_user_must_be_public_parking_spot_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_public_parking_spot_user
    public_parking_spot = PublicParkingSpot.find(params[:id])

    unless current_user == public_parking_spot.offer_user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = PublicParkingSpot.ransack(params[:q])
    @public_parking_spots = @q.result(:distinct => true).includes(:offer_user, :accept_user).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@public_parking_spots.where.not(:address_latitude => nil)) do |public_parking_spot, marker|
      marker.lat public_parking_spot.address_latitude
      marker.lng public_parking_spot.address_longitude
      marker.infowindow "<h5><a href='/public_parking_spots/#{public_parking_spot.id}'>#{public_parking_spot.created_at}</a></h5><small>#{public_parking_spot.address_formatted_address}</small>"
    end

    render("public_parking_spots/index.html.erb")
  end

  def show
    @public_parking_spot = PublicParkingSpot.find(params[:id])

    render("public_parking_spots/show.html.erb")
  end

  def new
    @public_parking_spot = PublicParkingSpot.new

    render("public_parking_spots/new.html.erb")
  end

  def create
    @public_parking_spot = PublicParkingSpot.new

    @public_parking_spot.address = params[:address]
    @public_parking_spot.city = params[:city]
    @public_parking_spot.zipcode = params[:zipcode]
    @public_parking_spot.time = params[:time]
    @public_parking_spot.car_type = params[:car_type]
    @public_parking_spot.offer_user_id = params[:offer_user_id]
    @public_parking_spot.type_of_parking = params[:type_of_parking]
    @public_parking_spot.max_time = params[:max_time]
    @public_parking_spot.price = params[:price]
    @public_parking_spot.description = params[:description]
    @public_parking_spot.accept_user_id = params[:accept_user_id]
    @public_parking_spot.neighborhood = params[:neighborhood]
    @public_parking_spot.already_paid = params[:already_paid]
    @public_parking_spot.paid_time = params[:paid_time]

    save_status = @public_parking_spot.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/public_parking_spots/new", "/create_public_parking_spot"
        redirect_to("/public_parking_spots")
      else
        redirect_back(:fallback_location => "/", :notice => "Public parking spot created successfully.")
      end
    else
      render("public_parking_spots/new.html.erb")
    end
  end

  def edit
    @public_parking_spot = PublicParkingSpot.find(params[:id])

    render("public_parking_spots/edit.html.erb")
  end

  def update
    @public_parking_spot = PublicParkingSpot.find(params[:id])

    @public_parking_spot.address = params[:address]
    @public_parking_spot.city = params[:city]
    @public_parking_spot.zipcode = params[:zipcode]
    @public_parking_spot.time = params[:time]
    @public_parking_spot.car_type = params[:car_type]
    @public_parking_spot.offer_user_id = params[:offer_user_id]
    @public_parking_spot.type_of_parking = params[:type_of_parking]
    @public_parking_spot.max_time = params[:max_time]
    @public_parking_spot.price = params[:price]
    @public_parking_spot.description = params[:description]
    @public_parking_spot.accept_user_id = params[:accept_user_id]
    @public_parking_spot.neighborhood = params[:neighborhood]
    @public_parking_spot.already_paid = params[:already_paid]
    @public_parking_spot.paid_time = params[:paid_time]

    save_status = @public_parking_spot.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/public_parking_spots/#{@public_parking_spot.id}/edit", "/update_public_parking_spot"
        redirect_to("/public_parking_spots/#{@public_parking_spot.id}", :notice => "Public parking spot updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Public parking spot updated successfully.")
      end
    else
      render("public_parking_spots/edit.html.erb")
    end
  end

  def destroy
    @public_parking_spot = PublicParkingSpot.find(params[:id])

    @public_parking_spot.destroy

    if URI(request.referer).path == "/public_parking_spots/#{@public_parking_spot.id}"
      redirect_to("/", :notice => "Public parking spot deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Public parking spot deleted.")
    end
  end
end
