class ReservationsController < ApplicationController
  def index
    @q = Reservation.ransack(params[:q])
    @reservations = @q.result(:distinct => true).includes(:user, :accept_user).page(params[:page]).per(10)

    render("reservations/index.html.erb")
  end

  def show
    @reservation = Reservation.find(params[:id])

    render("reservations/show.html.erb")
  end

  def new
    @reservation = Reservation.new

    render("reservations/new.html.erb")
  end

  def reserve

    @reservation = Reservation.new
    @public_parking_spot = PublicParkingSpot.find(params[:id])

    if current_user == @public_parking_spot.offer_user
      redirect_back(:fallback_location => "/", :notice => "YOU CANNOT RESERVE YOUR OWN PARKING SPOT!")
    else

    if current_user.points < @public_parking_spot.points
      redirect_back(:fallback_location => "/", :notice => "YOU DON'T HAVE ENOUGH POINTS TO RESERVE A PARKING SPOT!")
    else
      @newpoints_accept = current_user.points - @public_parking_spot.points
      @newpoints_offer = @public_parking_spot.offer_user.points + @public_parking_spot.points
      @reservation.offer_points = @newpoints_offer
      @reservation.accept_points = @newpoints_accept

      @reservation.city = @public_parking_spot.city
      @reservation.zipcode = @public_parking_spot.zipcode
      @reservation.time = @public_parking_spot.starting_time
      @reservation.offer_user_id = @public_parking_spot.offer_user_id
      @reservation.date = @public_parking_spot.date
      @reservation.points = @public_parking_spot.points
      @reservation.accept_user_id = current_user.id

      r_offer_user = User.find_by(:id => @reservation.offer_user_id)
      r_accept_user = User.find_by(:id => @reservation.accept_user_id)

    r_offer_user.points = @newpoints_offer
    r_accept_user.points = @newpoints_accept

    r_offer_user.save
    r_accept_user.save

    save_status = @reservation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reservations/new", "/create_reservation"
        redirect_to("/reservations")
      else
        redirect_back(:fallback_location => "/", :notice => "Reservation created successfully.")
        @public_parking_spot.destroy
      end
    else
      render("reservations/new.html.erb")
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])

    render("reservations/edit.html.erb")
  end

  def update
    @reservation = Reservation.find(params[:id])

    @reservation.city = params[:city]
    @reservation.zipcode = params[:zipcode]
    @reservation.time = params[:time]
    @reservation.date = params[:date]
    @reservation.offer_user_id = params[:offer_user_id]
    @reservation.accept_user_id = params[:accept_user_id]
    @reservation.points = params[:points]

    save_status = @reservation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/reservations/#{@reservation.id}/edit", "/update_reservation"
        redirect_to("/reservations/#{@reservation.id}", :notice => "Reservation updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Reservation updated successfully.")
      end
    else
      render("reservations/edit.html.erb")
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])

    @reservation.destroy

    if URI(request.referer).path == "/reservations/#{@reservation.id}"
      redirect_to("/", :notice => "Reservation deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Reservation deleted.")
    end
  end
end
end
end
