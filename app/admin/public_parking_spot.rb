ActiveAdmin.register PublicParkingSpot do

 permit_params :address, :city, :zipcode, :date, :starting_time, :max_time, :car_type, :street_parking_price, :description, :pub_offer_user_id, :points, :offer_user_id, :accept_user_id

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
