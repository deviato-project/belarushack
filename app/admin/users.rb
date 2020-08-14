ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_type_id, :name, :contact, :surname, :title, :description, :funding_reason, :funding_amount_cents, :funding_amount_currency, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_type_id, :name, :contact, :surname, :title, :description, :funding_reason, :funding_amount_cents, :funding_amount_currency, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
