class SpotsAvaiablesController < ApplicationController
  def index
    @q = SpotsAvaiable.ransack(params[:q])
    @spots_avaiables = @q.result(:distinct => true).includes(:neighborhood).page(params[:page]).per(10)

    render("spots_avaiables/index.html.erb")
  end

  def show
    @spots_avaiable = SpotsAvaiable.find(params[:id])

    render("spots_avaiables/show.html.erb")
  end

  def new
    @spots_avaiable = SpotsAvaiable.new

    render("spots_avaiables/new.html.erb")
  end

  def create
    @spots_avaiable = SpotsAvaiable.new

    @spots_avaiable.streets = params[:streets]
    @spots_avaiable.time = params[:time]
    @spots_avaiable.thanks = params[:thanks]
    @spots_avaiable.neighborhood_id = params[:neighborhood_id]

    save_status = @spots_avaiable.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/spots_avaiables/new", "/create_spots_avaiable"
        redirect_to("/spots_avaiables")
      else
        redirect_back(:fallback_location => "/", :notice => "Spots avaiable created successfully.")
      end
    else
      render("spots_avaiables/new.html.erb")
    end
  end

  def edit
    @spots_avaiable = SpotsAvaiable.find(params[:id])

    render("spots_avaiables/edit.html.erb")
  end

  def update
    @spots_avaiable = SpotsAvaiable.find(params[:id])

    @spots_avaiable.streets = params[:streets]
    @spots_avaiable.time = params[:time]
    @spots_avaiable.thanks = params[:thanks]
    @spots_avaiable.neighborhood_id = params[:neighborhood_id]

    save_status = @spots_avaiable.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/spots_avaiables/#{@spots_avaiable.id}/edit", "/update_spots_avaiable"
        redirect_to("/spots_avaiables/#{@spots_avaiable.id}", :notice => "Spots avaiable updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Spots avaiable updated successfully.")
      end
    else
      render("spots_avaiables/edit.html.erb")
    end
  end

  def destroy
    @spots_avaiable = SpotsAvaiable.find(params[:id])

    @spots_avaiable.destroy

    if URI(request.referer).path == "/spots_avaiables/#{@spots_avaiable.id}"
      redirect_to("/", :notice => "Spots avaiable deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Spots avaiable deleted.")
    end
  end
end
