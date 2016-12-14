ActiveAdmin.register PublicParkingSpot do

 permit_params :address, :city, :zipcode, :time, :car_type, :pub_offer_user_id, :type_of_parking, :max_time, :pub_price, :description, :pub_accept_user_id, :already_paid, :paid_time, :pub_date, :pub_points

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
