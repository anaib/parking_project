Rails.application.routes.draw do
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
