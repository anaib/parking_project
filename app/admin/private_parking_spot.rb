ActiveAdmin.register PrivateParkingSpot do

 permit_params :address, :city, :zipcode, :pri_date, :pri_time, :pri_price, :pri_offer_user_id, :pri_points, :pri_accept_user_id

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
