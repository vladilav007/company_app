ActiveAdmin.register User do

  permit_params :email, :company_id, :name, :position
  
  
end
