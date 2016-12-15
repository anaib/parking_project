class SpotsInformationsController < ApplicationController
  def index
    @q = SpotsInformation.ransack(params[:q])
    @spots_informations = @q.result(:distinct => true).includes(:user).page(params[:page]).per(10)

    render("spots_informations/index.html.erb")
  end

  def show
    @spots_information = SpotsInformation.find(params[:id])

    render("spots_informations/show.html.erb")
  end

  def new
    @spots_information = SpotsInformation.new

    render("spots_informations/new.html.erb")
  end

  def create
    @spots_information = SpotsInformation.new

    @spots_information.city = params[:city]
    @spots_information.user_id = params[:user_id]
    @spots_information.zipcode = params[:zipcode]
    @spots_information.streets = params[:streets]
    @spots_information.thanks = params[:thanks]

    save_status = @spots_information.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/spots_informations/new", "/create_spots_information"
        redirect_to("/spots_informations")
      else
        redirect_back(:fallback_location => "/", :notice => "Spots information created successfully.")
      end
    else
      render("spots_informations/new.html.erb")
    end
  end

  def edit
    @spots_information = SpotsInformation.find(params[:id])

    render("spots_informations/edit.html.erb")
  end

  def update
    @spots_information = SpotsInformation.find(params[:id])

    @spots_information.city = params[:city]
    @spots_information.user_id = params[:user_id]
    @spots_information.zipcode = params[:zipcode]
    @spots_information.streets = params[:streets]
    @spots_information.thanks = params[:thanks]

    save_status = @spots_information.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/spots_informations/#{@spots_information.id}/edit", "/update_spots_information"
        redirect_to("/spots_informations/#{@spots_information.id}", :notice => "Spots information updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Spots information updated successfully.")
      end
    else
      render("spots_informations/edit.html.erb")
    end
  end

  def destroy
    @spots_information = SpotsInformation.find(params[:id])

    @spots_information.destroy

    if URI(request.referer).path == "/spots_informations/#{@spots_information.id}"
      redirect_to("/", :notice => "Spots information deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Spots information deleted.")
    end
  end
end
