Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "public_parking_spots#index"
  # Routes for the Private_parking_spot resource:
  # CREATE
  get "/private_parking_spots/new", :controller => "private_parking_spots", :action => "new"
  post "/create_private_parking_spot", :controller => "private_parking_spots", :action => "create"

  # READ
  get "/private_parking_spots", :controller => "private_parking_spots", :action => "index"
  get "/private_parking_spots/:id", :controller => "private_parking_spots", :action => "show"

  # UPDATE
  get "/private_parking_spots/:id/edit", :controller => "private_parking_spots", :action => "edit"
  post "/update_private_parking_spot/:id", :controller => "private_parking_spots", :action => "update"

  # DELETE
  get "/delete_private_parking_spot/:id", :controller => "private_parking_spots", :action => "destroy"
  #------------------------------

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

  # Routes for the Spots_information resource:
  # CREATE
  get "/spots_informations/new", :controller => "spots_informations", :action => "new"
  post "/create_spots_information", :controller => "spots_informations", :action => "create"

  # READ
  get "/spots_informations", :controller => "spots_informations", :action => "index"
  get "/spots_informations/:id", :controller => "spots_informations", :action => "show"

  # UPDATE
  get "/spots_informations/:id/edit", :controller => "spots_informations", :action => "edit"
  post "/update_spots_information/:id", :controller => "spots_informations", :action => "update"

  # DELETE
  get "/delete_spots_information/:id", :controller => "spots_informations", :action => "destroy"
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

  # Routes for the Public_parking_spot resource:
  # CREATE
  get "/public_parking_spots/new", :controller => "public_parking_spots", :action => "new"
  post "/create_public_parking_spot", :controller => "public_parking_spots", :action => "create"

  # READ
  get "/public_parking_spots", :controller => "public_parking_spots", :action => "index"
  get "/public_parking_spots/:id", :controller => "public_parking_spots", :action => "show"

  # UPDATE
  get "/public_parking_spots/:id/edit", :controller => "public_parking_spots", :action => "edit"
  post "/update_public_parking_spot/:id", :controller => "public_parking_spots", :action => "update"

  # DELETE
  get "/delete_public_parking_spot/:id", :controller => "public_parking_spots", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
