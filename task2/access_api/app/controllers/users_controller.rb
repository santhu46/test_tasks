class UsersController < ApplicationController

  before_filter :create_connection, only: [:verify_api]

  def create_connection
    @conn = Faraday.new(:url => 'http://localhost:3000') do |faraday|
    faraday.request  :url_encoded             # form-encode POST params
    faraday.response :logger                  # log requests to STDOUT
    faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def verify_api
   response=@conn.get '/Api/V1/users/verify_email', { :email => params[:email] } 
   @response= JSON.parse(response.body)
   @email =params[:email]
  end

  def new
  end
end
