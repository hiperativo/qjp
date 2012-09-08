
ActiveAdmin.register AdminUser do     
  controller.authorize_resource
  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 

  # menu :label => (can? :manage, AdminUser)
  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :nome                  
      f.input :resumo                  
      f.input :avatar                  
      f.input :login                  
      f.input :email                  
      f.input :power, :collection => [["Editor", 1], ["Admin", 5]], :as => :select, :include_blank => false
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.buttons                         
  end
end                                   
