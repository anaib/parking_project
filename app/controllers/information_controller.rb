class InformationController < ApplicationController
  def index
    @information = Information.all

    render("information/index.html.erb")
  end

  def show
    @spots_avaiable = SpotsAvaiable.new
    @information = Information.find(params[:id])

    render("information/show.html.erb")
  end

  def new
    @information = Information.new

    render("information/new.html.erb")
  end

  def create
    @information = Information.new

    @information.city = params[:city]
    @information.neighborhood = params[:neighborhood]
    @information.user_id = params[:user_id]

    save_status = @information.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/information/new", "/create_information"
        redirect_to("/information")
      else
        redirect_back(:fallback_location => "/", :notice => "Information created successfully.")
      end
    else
      render("information/new.html.erb")
    end
  end

  def edit
    @information = Information.find(params[:id])

    render("information/edit.html.erb")
  end

  def update
    @information = Information.find(params[:id])

    @information.city = params[:city]
    @information.neighborhood = params[:neighborhood]
    @information.user_id = params[:user_id]

    save_status = @information.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/information/#{@information.id}/edit", "/update_information"
        redirect_to("/information/#{@information.id}", :notice => "Information updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Information updated successfully.")
      end
    else
      render("information/edit.html.erb")
    end
  end

  def destroy
    @information = Information.find(params[:id])

    @information.destroy

    if URI(request.referer).path == "/information/#{@information.id}"
      redirect_to("/", :notice => "Information deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Information deleted.")
    end
  end
end
