class PrivateParkingSpotsController < ApplicationController
  def index
    @q = PrivateParkingSpot.ransack(params[:q])
    @private_parking_spots = @q.result(:distinct => true).includes(:offer_user, :accept_user).page(params[:page]).per(10)

    render("private_parking_spots/index.html.erb")
  end

  def show
    @private_parking_spot = PrivateParkingSpot.find(params[:id])

    render("private_parking_spots/show.html.erb")
  end

  def new
    @private_parking_spot = PrivateParkingSpot.new

    render("private_parking_spots/new.html.erb")
  end

  def create
    @private_parking_spot = PrivateParkingSpot.new

    @private_parking_spot.address = params[:address]
    @private_parking_spot.city = params[:city]
    @private_parking_spot.zipcode = params[:zipcode]
    @private_parking_spot.pri_date = params[:pri_date]
    @private_parking_spot.pri_time = params[:pri_time]
    @private_parking_spot.pri_price = params[:pri_price]
    @private_parking_spot.pri_offer_user_id = params[:pri_offer_user_id]
    @private_parking_spot.pri_points = params[:pri_points]
    @private_parking_spot.pri_accept_user_id = params[:pri_accept_user_id]

    save_status = @private_parking_spot.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/private_parking_spots/new", "/create_private_parking_spot"
        redirect_to("/private_parking_spots")
      else
        redirect_back(:fallback_location => "/", :notice => "Private parking spot created successfully.")
      end
    else
      render("private_parking_spots/new.html.erb")
    end
  end

  def edit
    @private_parking_spot = PrivateParkingSpot.find(params[:id])

    render("private_parking_spots/edit.html.erb")
  end

  def update
    @private_parking_spot = PrivateParkingSpot.find(params[:id])

    @private_parking_spot.address = params[:address]
    @private_parking_spot.city = params[:city]
    @private_parking_spot.zipcode = params[:zipcode]
    @private_parking_spot.pri_date = params[:pri_date]
    @private_parking_spot.pri_time = params[:pri_time]
    @private_parking_spot.pri_price = params[:pri_price]
    @private_parking_spot.pri_offer_user_id = params[:pri_offer_user_id]
    @private_parking_spot.pri_points = params[:pri_points]
    @private_parking_spot.pri_accept_user_id = params[:pri_accept_user_id]

    save_status = @private_parking_spot.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/private_parking_spots/#{@private_parking_spot.id}/edit", "/update_private_parking_spot"
        redirect_to("/private_parking_spots/#{@private_parking_spot.id}", :notice => "Private parking spot updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Private parking spot updated successfully.")
      end
    else
      render("private_parking_spots/edit.html.erb")
    end
  end

  def destroy
    @private_parking_spot = PrivateParkingSpot.find(params[:id])

    @private_parking_spot.destroy

    if URI(request.referer).path == "/private_parking_spots/#{@private_parking_spot.id}"
      redirect_to("/", :notice => "Private parking spot deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Private parking spot deleted.")
    end
  end
end
