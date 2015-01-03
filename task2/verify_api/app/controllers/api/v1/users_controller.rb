
module Api
  module V1
    class UsersController < ApplicationController
      #To know whether email verified or not
      def verify_email
        respond_to do |format|
        format.json { render :status => 200, json: { "Error" => "Email should not be nil"}} if(params[:email] == "") || (params[:email].nil?)
        @user = User.where(:email => params[:email]).first
        if @user.nil? 
          format.json { render :status => 200, json: { "Error" => "User is Not Exist"}}
        else
          if @user.status == true
            format.json { render :status => 200,json: {"is_verified" => true} }
          else
            format.json { render :status => 200, json: { "is_verified" => false} }
          end
        end
        end
      end
    end
  end
end
