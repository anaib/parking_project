Rails.application.routes.draw do
  root :to => "parking_spots#index"
  # Routes for the Spots_avaiable resource:
  # CREATE
  get "/spots_avaiables/new", :controller => "spots_avaiables", :action => "new"
  post "/create_spots_avaiable", :controller => "spots_avaiables", :action => "create"

  # READ
  get "/spots_avaiables", :controller => "spots_avaiables", :action => "index"
  get "/spots_avaiables/:id", :controller => "spots_avaiables", :action => "show"

  # UPDATE
  get "/spots_avaiables/:id/edit", :controller => "spots_avaiables", :action => "edit"
  post "/update_spots_avaiable/:id", :controller => "spots_avaiables", :action => "update"

  # DELETE
  get "/delete_spots_avaiable/:id", :controller => "spots_avaiables", :action => "destroy"
  #------------------------------

  # Routes for the Information resource:
  # CREATE
  get "/information/new", :controller => "information", :action => "new"
  post "/create_information", :controller => "information", :action => "create"

  # READ
  get "/information", :controller => "information", :action => "index"
  get "/information/:id", :controller => "information", :action => "show"

  # UPDATE
  get "/information/:id/edit", :controller => "information", :action => "edit"
  post "/update_information/:id", :controller => "information", :action => "update"

  # DELETE
  get "/delete_information/:id", :controller => "information", :action => "destroy"
  #------------------------------

  # Routes for the Car resource:
  # CREATE
  get "/cars/new", :controller => "cars", :action => "new"
  post "/create_car", :controller => "cars", :action => "create"

  # READ
  get "/cars", :controller => "cars", :action => "index"
  get "/cars/:id", :controller => "cars", :action => "show"

  # UPDATE
  get "/cars/:id/edit", :controller => "cars", :action => "edit"
  post "/update_car/:id", :controller => "cars", :action => "update"

  # DELETE
  get "/delete_car/:id", :controller => "cars", :action => "destroy"
  #------------------------------

  # Routes for the Parking_spot resource:
  # CREATE
  get "/parking_spots/new", :controller => "parking_spots", :action => "new"
  post "/create_parking_spot", :controller => "parking_spots", :action => "create"

  # READ
  get "/parking_spots", :controller => "parking_spots", :action => "index"
  get "/parking_spots/:id", :controller => "parking_spots", :action => "show"

  # UPDATE
  get "/parking_spots/:id/edit", :controller => "parking_spots", :action => "edit"
  post "/update_parking_spot/:id", :controller => "parking_spots", :action => "update"

  # DELETE
  get "/delete_parking_spot/:id", :controller => "parking_spots", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
