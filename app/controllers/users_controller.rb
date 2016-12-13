class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(:distinct => true).includes(:parking_spots, :cars, :information).page(params[:page]).per(10)

    render("users/index.html.erb")
  end

  def show
    @information = Information.new
    @car = Car.new
    @parking_spot = ParkingSpot.new
    @user = User.find(params[:id])

    render("users/show.html.erb")
  end

  def new
    @user = User.new

    render("users/new.html.erb")
  end

  def create
    @user = User.new

    @user.password = params[:password]
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.city = params[:city]
    @user.phone_number = params[:phone_number]
    @user.points = params[:points]

    save_status = @user.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/users/new", "/create_user"
        redirect_to("/users")
      else
        redirect_back(:fallback_location => "/", :notice => "User created successfully.")
      end
    else
      render("users/new.html.erb")
    end
  end

  def edit
    @user = User.find(params[:id])

    render("users/edit.html.erb")
  end

  def update
    @user = User.find(params[:id])

    @user.password = params[:password]
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.city = params[:city]
    @user.phone_number = params[:phone_number]
    @user.points = params[:points]

    save_status = @user.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/users/#{@user.id}/edit", "/update_user"
        redirect_to("/users/#{@user.id}", :notice => "User updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "User updated successfully.")
      end
    else
      render("users/edit.html.erb")
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    if URI(request.referer).path == "/users/#{@user.id}"
      redirect_to("/", :notice => "User deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "User deleted.")
    end
  end
end
