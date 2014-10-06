Rails.application.routes.draw do
  root 'main#index'

  get "login" => "user#login", as: "new_user_session"
  get "grant" => "user#grant", as: "user_grant"
end
