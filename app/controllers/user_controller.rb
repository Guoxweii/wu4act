class UserController < ApplicationController
  def login
    authorize_url = "https://github.com/login/oauth/authorize"
    redirect_to authorize_url
  end
end