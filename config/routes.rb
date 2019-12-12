Rails.application.routes.draw do

  # Home Screen
  match("/", { :controller => "executions", :action => "index_no_form", :via => "get"})

  #Profile
  match("/profile", { :controller => "executions", :action => "index_profile", :via => "get"})

  # Routes for the Execution resource:

  # CREATE
  match("/insert_execution", { :controller => "executions", :action => "create", :via => "post"})
          
  # READ
  match("/executions", { :controller => "executions", :action => "index", :via => "get"})

  match("/executions_form", { :controller => "executions", :action => "form", :via => "get"})
  
  match("/executions/:id_from_path", { :controller => "executions", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_execution/:id_from_path", { :controller => "executions", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_execution/:id_from_path", { :controller => "executions", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Lift resource:

  # CREATE
  match("/insert_lift", { :controller => "lifts", :action => "create", :via => "post"})
          
  # READ
  match("/lifts", { :controller => "lifts", :action => "index_no_form", :via => "get"})

  match("/lifts_form", { :controller => "lifts", :action => "form", :via => "get" })
  
  match("/lifts/:id_from_path", { :controller => "lifts", :action => "show", :via => "get"})
  
  match("/lifts/:id_from_path/history", { :controller => "lifts", :action => "history", :via => "get"})

  # UPDATE
  
  match("/modify_lift/:id_from_path", { :controller => "lifts", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_lift/:id_from_path", { :controller => "lifts", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Muscle Group resource:

  # CREATE
  match("/insert_muscle_group", { :controller => "muscle_groups", :action => "create", :via => "post"})
          
  # READ

  match("/muscle_groups", { :controller => "muscle_groups", :action => "index", :via => "get"})

  match("/muscle_groups_no_form", { :controller => "muscle_groups", :action => "index_no_form", :via => "get" })
    
  match("/muscle_groups/:id_from_path", { :controller => "muscle_groups", :action => "show", :via => "get"})
  
  # UPDATE
  match("/modify_muscle_group/:id_from_path", { :controller => "muscle_groups", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_muscle_group/:id_from_path", { :controller => "muscle_groups", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for signing up

  match("/user_sign_up", { :controller => "users", :action => "new_registration_form", :via => "get"})
  
  # Routes for signing in
  match("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form", :via => "get"})
  
  match("/user_verify_credentials", { :controller => "user_sessions", :action => "add_cookie", :via => "post"})
  
  # Route for signing out
  
  match("/user_sign_out", { :controller => "user_sessions", :action => "remove_cookies", :via => "get"})
  
  # Route for creating account into database 

  match("/post_user", { :controller => "users", :action => "create", :via => "post" })
  
  # Route for editing account
  
  match("/edit_user", { :controller => "users", :action => "edit_registration_form", :via => "get"})
  
  match("/patch_user", { :controller => "users", :action => "update", :via => "post"})
  
  # Route for removing an account
  
  match("/cancel_user_account", { :controller => "users", :action => "destroy", :via => "get"})


  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
