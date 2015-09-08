class UsersController < ApplicationController
  
  before_filter :authorize, only: [:show]
  
  # form to create a new user
  def new
    if current_user
      redirect_to profile_path
    else
      @user = User.new
      render :new
    end
  end

  # creates new user in db
  def create
    if current_user
      redirect_to profile_path
    else
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        # redirect_to '/profile'
        redirect_to profile_path
        flash[:notice] = "Successfully created new account!"
      else
        # redirect_to '/signup'
        redirect_to signup_path
      end
    end
  end

  # show current user
  def show
    render :show

  end

  # form to edit user profile
  def edit
    @user = User.find(current_user)
    render :edit
  end

  # update user profile's info in db
  def update
    user = User.find(params[:id])
    if current_user
      # flash[:notice] = "Successfully updated profile!"
      user.update_attributes(user_params)
      redirect_to profile_path
    else
      flash[:error] = user.errors.full_messages.join(', ')
      redirect_to edit_profile_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user
      # flash[:error] = "Successfully deleted profile!"
      @user.destroy
      session[:user_id] = nil
      redirect_to root_path
    end
  end
  
  private 
    def user_params 
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
    end

end