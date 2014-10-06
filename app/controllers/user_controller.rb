class UserController < ApplicationController
  def login
    query = {
      client_id: "e12a45d28264f5dd0953",
      redirect_uri: "http://localhost:3000/grant",
      scope: "user,public_repo",
      state: "gxw-test"
    }
    authorize_url = "https://github.com/login/oauth/authorize?" + query.to_query

    redirect_to authorize_url
  end

  def grant

    authorize_url = "https://github.com/login/oauth/access_token"

    conn = Faraday.new do |conn|
      conn.request  :url_encoded
      conn.response :raise_error
      conn.request :oauth2, 'access_token'
      conn.adapter  Faraday.default_adapter
    end

    query = {
              client_id: "e12a45d28264f5dd0953",
              client_secret: "d01efd5f44d7b956746690d0a12dff43ab05de0c",
              code: params[:code],
              redirect_uri: "http://localhost:3000/grant"
            }

    response = conn.post authorize_url, query
  end
end