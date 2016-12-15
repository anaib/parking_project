class PublicParkingSpotsController < ApplicationController
  def index
    @q = PublicParkingSpot.ransack(params[:q])
    @public_parking_spots = @q.result(:distinct => true).includes(:offer_user, :accept_user).page(params[:page]).per(10)

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
    @public_parking_spot.date = params[:date]
    @public_parking_spot.starting_time = params[:starting_time]
    @public_parking_spot.max_time = params[:max_time]
    @public_parking_spot.car_type = params[:car_type]
    @public_parking_spot.street_parking_price = params[:street_parking_price]
    @public_parking_spot.description = params[:description]
    @public_parking_spot.pub_offer_user_id = params[:pub_offer_user_id]
    @public_parking_spot.points = params[:points]
    @public_parking_spot.offer_user_id = params[:offer_user_id]
    @public_parking_spot.accept_user_id = params[:accept_user_id]

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
    @public_parking_spot.date = params[:date]
    @public_parking_spot.starting_time = params[:starting_time]
    @public_parking_spot.max_time = params[:max_time]
    @public_parking_spot.car_type = params[:car_type]
    @public_parking_spot.street_parking_price = params[:street_parking_price]
    @public_parking_spot.description = params[:description]
    @public_parking_spot.pub_offer_user_id = params[:pub_offer_user_id]
    @public_parking_spot.points = params[:points]
    @public_parking_spot.offer_user_id = params[:offer_user_id]
    @public_parking_spot.accept_user_id = params[:accept_user_id]

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
