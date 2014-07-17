class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def logIn
  	#Rails.logger.info("params=#{params}")
  	@oldUser = User.authenticate(users_params)
  	if @oldUser.nil?
  		redirect_to url_for(:controller => 'users', :action => 'index')
  	else
  		sign_in @oldUser
  		redirect_to url_for(:controller => 'products', :action => 'index')
  	end
  end

  def register
  	@user = User.new(user_params)
    Rails.logger.info(user_params)
  	if @user.save
  	    sign_in @user
 	      redirect_to url_for(:controller => 'products', :action => 'index')
    else
        render "index"
    end
   end

   def logOut
   		sign_out 
   		redirect_to url_for(:controller => 'users', :action => 'index')
   end

   private 
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :confirmPassword)
  	end
  	def users_params
  		params.require(:oldUser).permit(:email, :password)
  	end
end
