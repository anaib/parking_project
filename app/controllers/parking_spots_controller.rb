class ParkingSpotsController < ApplicationController
  before_action :current_user_must_be_parking_spot_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_parking_spot_user
    parking_spot = ParkingSpot.find(params[:id])

    unless current_user == parking_spot.offer_user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @parking_spots = ParkingSpot.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@parking_spots.where.not(:address_latitude => nil)) do |parking_spot, marker|
      marker.lat parking_spot.address_latitude
      marker.lng parking_spot.address_longitude
      marker.infowindow "<h5><a href='/parking_spots/#{parking_spot.id}'>#{parking_spot.created_at}</a></h5><small>#{parking_spot.address_formatted_address}</small>"
    end

    render("parking_spots/index.html.erb")
  end

  def show
    @parking_spot = ParkingSpot.find(params[:id])

    render("parking_spots/show.html.erb")
  end

  def new
    @parking_spot = ParkingSpot.new

    render("parking_spots/new.html.erb")
  end

  def create
    @parking_spot = ParkingSpot.new

    @parking_spot.address = params[:address]
    @parking_spot.city = params[:city]
    @parking_spot.zipcode = params[:zipcode]
    @parking_spot.time = params[:time]
    @parking_spot.car_type = params[:car_type]
    @parking_spot.offer_user_id = params[:offer_user_id]
    @parking_spot.type_of_parking = params[:type_of_parking]
    @parking_spot.max_time = params[:max_time]
    @parking_spot.price = params[:price]
    @parking_spot.description = params[:description]
    @parking_spot.accept_user_id = params[:accept_user_id]
    @parking_spot.neighborhood = params[:neighborhood]

    save_status = @parking_spot.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/parking_spots/new", "/create_parking_spot"
        redirect_to("/parking_spots")
      else
        redirect_back(:fallback_location => "/", :notice => "Parking spot created successfully.")
      end
    else
      render("parking_spots/new.html.erb")
    end
  end

  def edit
    @parking_spot = ParkingSpot.find(params[:id])

    render("parking_spots/edit.html.erb")
  end

  def update
    @parking_spot = ParkingSpot.find(params[:id])

    @parking_spot.address = params[:address]
    @parking_spot.city = params[:city]
    @parking_spot.zipcode = params[:zipcode]
    @parking_spot.time = params[:time]
    @parking_spot.car_type = params[:car_type]
    @parking_spot.offer_user_id = params[:offer_user_id]
    @parking_spot.type_of_parking = params[:type_of_parking]
    @parking_spot.max_time = params[:max_time]
    @parking_spot.price = params[:price]
    @parking_spot.description = params[:description]
    @parking_spot.accept_user_id = params[:accept_user_id]
    @parking_spot.neighborhood = params[:neighborhood]

    save_status = @parking_spot.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/parking_spots/#{@parking_spot.id}/edit", "/update_parking_spot"
        redirect_to("/parking_spots/#{@parking_spot.id}", :notice => "Parking spot updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Parking spot updated successfully.")
      end
    else
      render("parking_spots/edit.html.erb")
    end
  end

  def destroy
    @parking_spot = ParkingSpot.find(params[:id])

    @parking_spot.destroy

    if URI(request.referer).path == "/parking_spots/#{@parking_spot.id}"
      redirect_to("/", :notice => "Parking spot deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Parking spot deleted.")
    end
  end
end
