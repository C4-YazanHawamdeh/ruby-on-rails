class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def show
  end

  def index
  end

  def new
    @user = User.new
  end

  # def create
  #   @user = User.create(user_params)
  #   if @user.valid?
  #     session[:user_id] = @user.id
  #     redirect_to @user
  #   else
  #     flash[:error] = "Error- please try to create an account again."
  #     redirect_to new_user_path
  #   end
  # end

  # def create
  
  #     @user=User.new(user_params)
  #     if@user.save
  #       session[:user_id]=@user.id
  #       redirect_to root_path
  #     else
  #       render:new
  #     end
  #   end    
          
  

  def create
    @user=User.find_by(email:params[:email])
    ## authenticate user credentials
    if !!@user &&@user.authenticate(params[:password])
        #set session and redirect on success
        session[:user_id]=@user.id
        redirect_to user_path
    else
        #error message on fail
        message="Something went wrong!Make sure your username and password are"
        redirect_to login_path,notice:message
    end
 end

  private 
  def user_params
    params.require(:user).permit(:email, :password)
  end




  # def destroy
  #   session[:user_id]=nil
  #   redirect to root path,notice:"Logged out"
  # end
def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/sessions/new', :notice => "Your patient has been deleted"
end

  # def destroy
  #   session[:user_id] = nil
  #   flash[:notice] = "You have been signed out!"
  #   redirect_to '/sessions/new', :notice => "Your patient has been deleted" 
  #  end
end
