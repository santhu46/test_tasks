class UsersController < ApplicationController

  #Create new user form page
  def new
     @user = User.new
  end

  #Create new user 
  def create
   @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to get_email_verification_users_path, notice: 'User email was successfully created. Please Verify Now' }
      else
        format.html { render action: "new" }
      end
    end
  end 
  def get_email_verification
  end

  #Verify email here 
  def verify_now
   @user = User.find_by_email(params[:email])
     respond_to do |format|
     if User.exists? @user
          @user.status =true
          if @user.save
           format.html { redirect_to get_email_verification_users_path, notice: 'Email Verified successfully.' }
          else
           format.html { redirect_to get_email_verification_users_path, notice: 'Email Not Verified Please try Again' }
          end
     else
         format.html { redirect_to get_email_verification_users_path, notice: 'Email Not Existed' }
     end
   end
  end

end
