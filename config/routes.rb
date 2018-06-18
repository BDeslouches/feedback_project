Rails.application.routes.draw do
  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Sign_up resource:
  # CREATE
  get "/sign_ups/new", :controller => "sign_ups", :action => "new"
  post "/create_sign_up", :controller => "sign_ups", :action => "create"

  # READ
  get "/sign_ups", :controller => "sign_ups", :action => "index"
  get "/sign_ups/:id", :controller => "sign_ups", :action => "show"

  # UPDATE
  get "/sign_ups/:id/edit", :controller => "sign_ups", :action => "edit"
  post "/update_sign_up/:id", :controller => "sign_ups", :action => "update"

  # DELETE
  get "/delete_sign_up/:id", :controller => "sign_ups", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
